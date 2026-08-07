Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CF721ABBB;
	Fri,  7 Aug 2026 04:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786077771; cv=none; b=hP+TEswfXDDvM96NHpssIX6bnPhky346ar+hg9S0GGP1pTE1dWLxzozS8+UIJtIZCNnZDEG7ceOKP34yA9rMc3pSurPynsKGVretR8cAowdeGnre8bb3+gm0d0/WN/vSIpRaP3LpJAXJ/yFv2oc1RKuf2Z4Dgk906j5S9amftk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786077771; c=relaxed/simple;
	bh=WQzgyFExui/jji4SlbsaMUg9A00OnHYeCZD0NqBP5nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtHGsxAz/I3Ei39uu/p8fv+S7yZddsO38PmVLu12nysPSo28bhM08F2eLnBBJlgJCZ/LwNNBWRKauoBSReL5IjjU9Qgp2bmBT3QA8vuPPNYSSYD8GQTnySEn5LqxzEep7aKv1OH6ppw1cr5j5zJQfD791KNT+0ewG9yYsXVj0yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3jXNhV6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3jXNhV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786077769; x=1817613769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WQzgyFExui/jji4SlbsaMUg9A00OnHYeCZD0NqBP5nc=;
  b=e3jXNhV6bVDVXvV4xEU+Fr/lVv9tveqSM13EXGGWXAE8DQ2c9kFzqW3T
   E5QM1H3aW7ky89D0PJIqGwX9z5b0kCHxEAIWLyh6tCO2Ol5UzoL9Foreq
   R9DaRrSNoeQ93U4ZKt6MwjZiNhMjH+OUx8v6Y8ypmp1akQsdDWsVnQYjK
   FRl/VlAqW+/y/6D8YKFHbWtbpAtImqropCHFQI/PcPJwpvFjVtmMElzpu
   CQilIgSUCIz9D7FA0J1eJyxBRbWDNSydo6gOH8FalFMSeWlJG+qdBBmSp
   o5Q7gLgO3OEu8aXRzIKCEsRPvvZ/SQFCzziy8rna4cb6ZIQPPPj5PQN4y
   w==;
X-CSE-ConnectionGUID: NKT/swblTAixZkgB0l5FBg==
X-CSE-MsgGUID: KkUVZvm+T+S4I2yEhbIWRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86794598"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86794598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 21:42:48 -0700
X-CSE-ConnectionGUID: C8Oo+PWATSOLkLQ4UNeMLA==
X-CSE-MsgGUID: zPNwphfGThm3JHhGC1O09w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="262351727"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2026 21:42:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsCPr-00000000HBR-11Pz;
	Fri, 07 Aug 2026 04:42:43 +0000
Date: Fri, 7 Aug 2026 12:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-sunxi@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, Jassi Brar <jassisinghbrar@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mailbox: sun6i: modernize probe and convert to fully
 managed
Message-ID: <202608071227.vRfy33Rr-lkp@intel.com>
References: <20260727194208.10082-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727194208.10082-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on linus/master v7.2-rc6 next-20260806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/mailbox-sun6i-modernize-probe-and-convert-to-fully-managed/20260807-054041
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20260727194208.10082-1-rosenp%40gmail.com
patch subject: [PATCH] mailbox: sun6i: modernize probe and convert to fully managed
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260807/202608071227.vRfy33Rr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071227.vRfy33Rr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608071227.vRfy33Rr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mailbox/sun6i-msgbox.c: In function 'sun6i_msgbox_probe':
>> drivers/mailbox/sun6i-msgbox.c:271:46: error: passing argument 1 of 'devm_mbox_controller_register' from incompatible pointer type [-Wincompatible-pointer-types]
     271 |         return devm_mbox_controller_register(&mbox->controller);
         |                                              ^~~~~~~~~~~~~~~~~
         |                                              |
         |                                              struct mbox_controller *
   In file included from drivers/mailbox/sun6i-msgbox.c:12:
   include/linux/mailbox_controller.h:149:50: note: expected 'struct device *' but argument is of type 'struct mbox_controller *'
     149 | int devm_mbox_controller_register(struct device *dev,
         |                                   ~~~~~~~~~~~~~~~^~~
>> drivers/mailbox/sun6i-msgbox.c:271:16: error: too few arguments to function 'devm_mbox_controller_register'; expected 2, have 1
     271 |         return devm_mbox_controller_register(&mbox->controller);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mailbox_controller.h:149:5: note: declared here
     149 | int devm_mbox_controller_register(struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/devm_mbox_controller_register +271 drivers/mailbox/sun6i-msgbox.c

   194	
   195	static int sun6i_msgbox_probe(struct platform_device *pdev)
   196	{
   197		struct device *dev = &pdev->dev;
   198		struct mbox_chan *chans;
   199		struct reset_control *reset;
   200		struct sun6i_msgbox *mbox;
   201		void __iomem *regs;
   202		int i, ret;
   203		int irq;
   204	
   205		irq = platform_get_irq(pdev, 0);
   206		if (irq < 0)
   207			return irq;
   208	
   209		regs = devm_platform_ioremap_resource(pdev, 0);
   210		if (IS_ERR(regs))
   211			return PTR_ERR(regs);
   212	
   213		mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
   214		if (!mbox)
   215			return -ENOMEM;
   216	
   217		chans = devm_kcalloc(dev, NUM_CHANS, sizeof(*chans), GFP_KERNEL);
   218		if (!chans)
   219			return -ENOMEM;
   220	
   221		for (i = 0; i < NUM_CHANS; ++i)
   222			chans[i].con_priv = mbox;
   223	
   224		mbox->clk = devm_clk_get_enabled(dev, NULL);
   225		if (IS_ERR(mbox->clk)) {
   226			ret = PTR_ERR(mbox->clk);
   227			dev_err(dev, "Failed to get clock: %d\n", ret);
   228			return ret;
   229		}
   230	
   231		reset = devm_reset_control_get_exclusive(dev, NULL);
   232		if (IS_ERR(reset)) {
   233			ret = PTR_ERR(reset);
   234			dev_err(dev, "Failed to get reset control: %d\n", ret);
   235			return ret;
   236		}
   237	
   238		/*
   239		 * NOTE: We rely on platform firmware to preconfigure the channel
   240		 * directions, and we share this hardware block with other firmware
   241		 * that runs concurrently with Linux (e.g. a trusted monitor).
   242		 *
   243		 * Therefore, we do *not* assert the reset line if probing fails or
   244		 * when removing the device.
   245		 */
   246		ret = reset_control_deassert(reset);
   247		if (ret) {
   248			dev_err(dev, "Failed to deassert reset: %d\n", ret);
   249			return ret;
   250		}
   251	
   252		mbox->regs = regs;
   253	
   254		/* Disable all IRQs for this end of the msgbox. */
   255		writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
   256	
   257		ret = devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_name(dev), mbox);
   258		if (ret)
   259			return ret;
   260	
   261		mbox->controller.dev           = dev;
   262		mbox->controller.ops           = &sun6i_msgbox_chan_ops;
   263		mbox->controller.chans         = chans;
   264		mbox->controller.num_chans     = NUM_CHANS;
   265		mbox->controller.txdone_irq    = false;
   266		mbox->controller.txdone_poll   = true;
   267		mbox->controller.txpoll_period = 5;
   268	
   269		spin_lock_init(&mbox->lock);
   270	
 > 271		return devm_mbox_controller_register(&mbox->controller);
   272	}
   273	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
