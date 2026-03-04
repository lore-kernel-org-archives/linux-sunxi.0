Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB693D75B3;
	Wed,  4 Mar 2026 19:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772652331; cv=none; b=isFNvvoqtePWbs8f4CULM7xNKQTY6mmQ2l2q2m7WyBn4cFd50XF7u9ry8OeTKRZB+S+371Ad+ly/SOymF5hQrDRwR0L5qK9YXwKrp8HlF1NUtDO3OXes6tgMV1Z4wsbZy6b0K9qc7MwCb1Qbr54lsF7g2TeSbSkVFYgqxz6e11U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772652331; c=relaxed/simple;
	bh=93zi98/SCHi0Xdt2/6okf2xCqWA0WfMJZVk3NLVoY/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8nv4t/XXfX/PANNNTMBrNnRWNxvlWIIir/BQXIebIB/aLJK86wzg9oeXMG1+EZtvBaYbp/tDyKupe+itmotdXeKdIV8ga7glIoZn/EGL+Pn3+rf22VCKJMYB2OmlC7dMrZmbLLesl/1wv9X+5xAJrRWImSOUnDjbFVIcYgkUTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4WD+aYv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4WD+aYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772652329; x=1804188329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=93zi98/SCHi0Xdt2/6okf2xCqWA0WfMJZVk3NLVoY/Y=;
  b=T4WD+aYveAhErF7JnCyEBp6zXXL8xXA1YQGsnQU4bvVaJ61i+FHeThmD
   jloUxqHScirmS7EwD95IwI8ex/Kb+X5D8hpADjUQOOSLTU2Di9b6eiIFX
   RCQvkQlPwZoFSotQRug4nZ/sOYu/Cvw7EiuUwz0598dKeilfXdXYDksTf
   TTW2yHG22C/sFLZIvOnwGq2XBTkQyeRWM36VIaL/Tg08TVBJh1uKEWOe1
   w7bqH9JVEL9drw+ekgxslskxw1aA6T9XViXlDWu9+EjM5WFlbdvrHdpVH
   DtP9hEDAsOeEC8GsBWrsIzL3A+cNWEwHIALTgCIic4YWaOSrgfjK929K6
   g==;
X-CSE-ConnectionGUID: d+RzRHGcQDqXRwEuIcfuHQ==
X-CSE-MsgGUID: S2gOHD4+SL2pcXDiMdJogQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72753236"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72753236"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 11:25:28 -0800
X-CSE-ConnectionGUID: dct93SjiSJaEO42FIENObw==
X-CSE-MsgGUID: ajr2Y/TORySK9X58Glk5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="218378608"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2026 11:25:26 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxrqU-000000004O5-0gkS;
	Wed, 04 Mar 2026 19:25:22 +0000
Date: Thu, 5 Mar 2026 03:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH net-next 8/8] net: stmmac: make pcs_mask and phy_mask u32
Message-ID: <202603050340.7qkvXUGq-lkp@intel.com>
References: <E1vxjNj-0000000Br1c-2Fg7@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vxjNj-0000000Br1c-2Fg7@rmk-PC.armlinux.org.uk>

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-mdio-use-same-test-for-MDC-clock-divisor-lookups/20260304-183416
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vxjNj-0000000Br1c-2Fg7%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 8/8] net: stmmac: make pcs_mask and phy_mask u32
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603050340.7qkvXUGq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050340.7qkvXUGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050340.7qkvXUGq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c: In function 'loongson_gnet_data':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:171:42: error: implicit declaration of function 'BIT_u32'; did you mean 'BIT_U32'? [-Wimplicit-function-declaration]
     171 |         plat->mdio_bus_data->phy_mask = ~BIT_u32(2);
         |                                          ^~~~~~~
         |                                          BIT_U32


vim +171 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c

   164	
   165	static int loongson_gnet_data(struct pci_dev *pdev,
   166				      struct plat_stmmacenet_data *plat)
   167	{
   168		loongson_default_data(pdev, plat);
   169	
   170		plat->phy_interface = PHY_INTERFACE_MODE_GMII;
 > 171		plat->mdio_bus_data->phy_mask = ~BIT_u32(2);
   172		plat->fix_mac_speed = loongson_gnet_fix_speed;
   173	
   174		return 0;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
