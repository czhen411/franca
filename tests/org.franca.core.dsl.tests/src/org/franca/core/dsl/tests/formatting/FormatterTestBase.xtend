/*******************************************************************************
 * Copyright (c) 2018 itemis AG (http://www.itemis.de).
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.franca.core.dsl.tests.formatting

import com.google.inject.Inject
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.resource.SaveOptions
import org.eclipse.xtext.serializer.ISerializer
import org.franca.core.franca.FModel

/**
 * Base class for all Franca IDL formatter tests.
 */
class FormatterTestBase {

	@Inject extension ISerializer
	@Inject extension ParseHelper<FModel> 

	val SaveOptions options = SaveOptions.newBuilder.format.options
	
	/**
	 * Parse a textual fidl model and serialize it (which includes formatting).
	 */
	def protected String format(String input) {
		input.parse.serialize(options)
	}

	/**
	 * Helper which removes all whitespaces from empty lines in multiline strings.
	 */
	def protected String chompEmpty(String it) {
		replaceAll("(?m)^[ \t]*\r?\n", "\n")
	}

}
