Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551456;
	b=vNtMssygWqO9cYLL7keN+41XEPUPZK6fvNSDmVG5TJhSsN11nsM1L1po0mzO72Zk90vQ
	 xdOgHO9tEWzYhcfVOsx5rhI3T21zvc8PgmqQj19zzn7zr0M7AcWD47Lu3tmvC0qfSGQFM
	 FXgp/fdxOlYExDQobljaWSLp7Q33FKehUx5K4UQ1Dlc1F8U739SG4f0nKZPSYTfiQLTMY
	 DJ1CRCL/PQsdw/v4MtIDS+MpRusHUpxohuJ8gJHTq2VTZdTsCOIymTqgRP36NekV42Ikw
	 mW7DZcPV7XTHbXYnIdmv5m4Cb/fGOQteBNSJL8WjgDCIAj5zFs2dfapUe73zsKw7RzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551456;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=O+rpuV/3Cdeqi3olBPq3dLsHItggXZ3BKkKR1WXWVLM=;
	b=qzMqR+Bndg0W1gRT7CM6FJFI/du6Cq11dmGqm3KBKgRcWp9G1yTilEgkjaj8c5yIQb2i
	 8gGraOEr+OH2rHJ+CPX4L0BrvFUy4K9TNtpGM369aPzznycSuIJVD9Eqy417G8WSZbEQv
	 p/z40Go47cPAKe4Lc9HxsdwkN2yaXnKi1wohrXibIQYccaTpOb40RzqAsPikilXgl6UoI
	 2QeY/ZgTkGUX5e4GCWySMayqtEcgv3rBdgHafwADrN8DtMvSQRo7/HE81QkxmT+A1F3SI
	 pqCqEybkudsCx24hVdfDzaz2IiUpxivF2MYDxekCo0wfxKP/ibpIkMYPxKnrx2Xt80w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="aMIcin/J";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EC6606A327
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 20:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9EC6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aMIcin/J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795551456; x=1827087456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vemVSTIihOUQsSm9fN9JJKFg/NjYffet9HHWmoPjrPI=;
  b=aMIcin/JqBMkc8hYc2uIhgaONMKKZ1lh8gpdnGxxyRVrhms8c56prgfO
   hqB0xSEX4QWdiWIKH/QmOJNkFcxPjOgpPTfnpCvbhhrW4kkzutnNj8vnm
   NHcOG10C+X+YPDCglyejN/QJduGUsCcHHwidRFVXHIhigK+cnYvEVLeLg
   nE5P53S8P4xlAUOUQ9lNMccfF4ZqmPvyJcFssE3kn1iK1vM/jQOtB5lak
   ht2oOhozJEnoYogJr/xscjkU+q5D8XVt+/By0a/U/Kqt16SMDHivg4jOc
   BmSDQF7JOi8+AHLP8of2hWYiqPZhNvw+tvq4GeGcL24wwxz+3kluJpY1T
   g==;
X-CSE-ConnectionGUID: 8uzDspjYQNCfeb2SDqreIQ==
X-CSE-MsgGUID: K3fqLRp1SxOa8Clp02dK/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4413224"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4413224"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:17:31 -0800
X-CSE-ConnectionGUID: fpE7LlwrSku8z6M0OuQLOw==
X-CSE-MsgGUID: 4ohg0cV2Q7uBUThxTfPeUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11648580"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:17:25 -0800
Date: Tue, 24 Nov 2026 22:17:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	Arnd Bergmann <arnd@arndb.de>, bui duc phuc <phucduc.bui@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, Joe Damato <joe@dama.to>,
	Julia Lawall <julia.lawall@inria.fr>,
	Li Youhong <liyouhong@kylinos.cn>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] net: allwinner: Use devm_clk_get_enabled() in
 emac_probe()
Message-ID: <awXw07bDd0bX4Mas@ashevche-desk.local>
References: <780975ed-825f-4f9b-8ac2-67664a7a2a2f@web.de>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <780975ed-825f-4f9b-8ac2-67664a7a2a2f@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 24, 2026 at 06:19:54PM +0100, Markus Elfring wrote:
> 
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>   keeping duplicate source code.
> 
> * Delete a clk_disable_unprepare() call on an error handling path
>   and in the implementation of the function “emac_remove”.
> 
> * Omit the label “out_clk_disable_unprepare”.
> 
> This issue was detected by using the Coccinelle software.

This breaks the order at remove and probe error path cases.
Note, devm_*() at this case will keep just a clk object, but
the actual enabling is done explicitly. W/o testing on real
HW it's hard to say if this order is strict or not.

-- 
With Best Regards,
Andy Shevchenko


