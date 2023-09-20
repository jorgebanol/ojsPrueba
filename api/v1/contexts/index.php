<?php
/**
 * @defgroup api_v1_contexts Context API requests
 */

/**
 * @file api/v1/contexts/index.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @ingroup api_v1_contexts
 *
 * @brief Handle API requests for contexts (journals/presses).
 */

// return new \APP\API\v1\contexts\ContextHandler(); // FIXME#7698: will be removed once merged pkp/pkp-lib#7698
return new \PKP\core\PKPApiRoutingHandler(new \PKP\API\v1\contexts\PKPContextController());
