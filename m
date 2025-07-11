Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B522A4CC;
	Fri, 11 Jul 2025 23:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752278258; cv=none; b=XanRhgSWVVOYX+muR1xZO/gw4v1h+2fY+x+Dt/1qxsDcvVHo4JFmb2j7bbrRpSyKYL6AVnYWbDEW/IMNly5MaV7t4WoTxf6xGDfFjjgmdZCJMp/SFE3HcI6MKwebHTtnI4lx5xzdBgToSv730KlV9P0sRENdTU8Dlx+N8bzDiis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752278258; c=relaxed/simple;
	bh=5tT9ORXucLaTLjjDZNriJx1evuX5cza/Yehns8ks1zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOSEPrzGA1sM/lxtxgCDou0+olRfxzyC2EIw0vjPfcQtR139KWUvNtZohoQaHXE+Vnvc90YW6lI4Ly7EtSdBZ0Pyv+adNdrWgD4SuTGd57XGbQwS5kQlslLLsFg9E9+rNFdg6U552ODzPxec+vqb3P3A07fVs+o84zLZgccZ88s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTkpEGDm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTkpEGDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752278256; x=1783814256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5tT9ORXucLaTLjjDZNriJx1evuX5cza/Yehns8ks1zc=;
  b=OTkpEGDmnezAW0cUFj4O1uuxp2dy//GzFEGwpk6Ppsxt0WEtnuaW1Gz4
   xz5fIx9XMymU7cE3a0+4ZvuCZTAvL0GtSp7BZMbHVTRSzyd7KJG0rNH4m
   sEXcXWWIb72weCtd7Nymirkgmm9wROja/hf6RE1OfgCEV1002oroKB86n
   +54q1YYw7XKsEjilW/FijZprWr+xQlUMRtMXNvm0+LpvlkjDgiUnu7z8w
   siIDEPQlTIutVEYoW3T4UCVhSsIHljKtG567kq9GZ2xHywlq0v0KheNgf
   1/BCOTClPuyLD8WIqeotYHf0ms+rA9yV+TTC17ZFnqXuzXjFB1KqgOPWQ
   w==;
X-CSE-ConnectionGUID: KBbETxKHTYaO5v29NcTAgQ==
X-CSE-MsgGUID: VPvWe4bcR0+h/i+PLNSe7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54436380"
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="54436380"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 16:57:35 -0700
X-CSE-ConnectionGUID: OqbzDUo+S4e1ZPXqnfb15g==
X-CSE-MsgGUID: /djIIIW1RIyf+YXjuYsB/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="156572850"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2025 16:57:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaNcP-0006uV-37;
	Fri, 11 Jul 2025 23:57:29 +0000
Date: Sat, 12 Jul 2025 07:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: iuncuim <iuncuim@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.or>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] arm64: dts: allwinner: a523: add Mali GPU node
Message-ID: <202507120723.0s2u9rLs-lkp@intel.com>
References: <20250711035730.17507-3-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711035730.17507-3-iuncuim@gmail.com>

Hi iuncuim,

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on robh/for-next linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/iuncuim/dt-bindings-gpu-mali-bifrost-Add-Allwinner-A523-compatible/20250711-120104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250711035730.17507-3-iuncuim%40gmail.com
patch subject: [PATCH v2 2/3] arm64: dts: allwinner: a523: add Mali GPU node
config: arm64-randconfig-001-20250712 (https://download.01.org/0day-ci/archive/20250712/202507120723.0s2u9rLs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120723.0s2u9rLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507120723.0s2u9rLs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:119.29-30 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
