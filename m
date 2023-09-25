Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21A51BDEA;
	Mon, 25 Sep 2023 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695660050; x=1727196050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=irBX2fasYwTUTHpDqrmJbVhDOEvr62Ct3dNu3hj8gtw=;
  b=nP0qfWead+48oXKb1L8t3fC2aGYeIVoK7iUtseE7/H98vZ99uw3tZKvU
   6T9YWGEquUR2BL+MV3fAXPxVS4mtr0o5pSJQTwDfzbQcaQEwNs50HUnBj
   PH3amTDWa5zY1CWvVrIRf3ACPtfvu9IZFoiIt2qXV4cAUx6jcSHTANaz7
   YHBhihDEYeb+XBf7YJ0eLg5nD02XtCX/F0kJmsXqekjG9hmYYTfhzytyK
   cuyh7IhuflelExjqTh01sV9kyns9yRyy/zanaDivCph70f0U02VHKPUTA
   HB+CxFw700spEt0dVFuadwR2coa59fIvEgrr56eQpVcsVH3nKNKTDn+Cl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378582737"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="378582737"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 09:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751771015"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="751771015"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Sep 2023 09:40:45 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkodU-0001o2-1r;
	Mon, 25 Sep 2023 16:40:41 +0000
Date: Tue, 26 Sep 2023 00:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
	wens@csie.org
Cc: oe-kbuild-all@lists.linux.dev, airlied@gmail.com, daniel@ffwll.ch,
	samuel@sholland.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Message-ID: <202309260027.aNIjQRBI-lkp@intel.com>
References: <20230924192604.3262187-6-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230924192604.3262187-6-jernej.skrabec@gmail.com>

Hi Jernej,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc3 next-20230925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jernej-Skrabec/drm-sun4i-dw-hdmi-Deinit-PHY-in-fail-path/20230925-032818
base:   linus/master
patch link:    https://lore.kernel.org/r/20230924192604.3262187-6-jernej.skrabec%40gmail.com
patch subject: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230926/202309260027.aNIjQRBI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260027.aNIjQRBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260027.aNIjQRBI-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/gpu/drm/sun4i/sun8i_hdmi_phy.o: in function `sun8i_hdmi_phy_driver_init':
>> sun8i_hdmi_phy.c:(.init.text+0x0): multiple definition of `init_module'; drivers/gpu/drm/sun4i/sun8i_dw_hdmi.o:sun8i_dw_hdmi.c:(.init.text+0x0): first defined here
   s390-linux-ld: drivers/gpu/drm/sun4i/sun8i_hdmi_phy.o: in function `sun8i_hdmi_phy_driver_exit':
>> sun8i_hdmi_phy.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/gpu/drm/sun4i/sun8i_dw_hdmi.o:sun8i_dw_hdmi.c:(.exit.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
