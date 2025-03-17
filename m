Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FAA194C86
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227515; cv=none; b=Z9DkR5YooDUV+8iN91XlJj0xP8PBXZieoksjEjq7caOR8sGoegdfKAskyAskDZFLhQDJM1yHYWdkFxbuvxehko7bshxeVAdQLyb19D5fx5bZc9nJhE6lsYhvThSiGICVqbOV+RN8rpEbgTHJ0xRJNdCa0IceVAapMHdhPP4H6KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227515; c=relaxed/simple;
	bh=gBan3RY0LoNCVgD61lrCi1GDyG/NWfQNDeRXn9WrIYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/A1Z0fA+EUvXzWA4AEuVEyyo3+BNl+pNQ+DuSSZ2ycVSgHBfqN54r3hcnJ9uCo/l13tSEtTYQTY51Xmny+3DsxSJ1WGNKD0CovwR89aw5gkXE4n8JDR7fIqx128XzExC2F/P0Npv3ykEuUUFOgLFxfLGzsp04p0bR//kve1RfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmWlovo2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmWlovo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742227514; x=1773763514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gBan3RY0LoNCVgD61lrCi1GDyG/NWfQNDeRXn9WrIYQ=;
  b=PmWlovo298OIlYvtAt9QLdLF/WUJgGdQ05IL6XvbpnxoJjKlpUhlzlhy
   ESLSwHO0ITfC/q5vDPO41LQXdb9MnXG7SbVJ+IhXMhhWSPk8OCusTZ1qu
   uy5y/LU6nb5g0t7NKcd/wQvvYd6mN3lGHV+5iV2AVEv5Uct2w5QM3Czw2
   GdtdKzcrH9kzX3tmT3vntfDrTRl3b/oyWcb+G6MRWxgTnlW2tJLSt9vue
   iTCjL19qtqCepzb9i0f2uJBB6XQQvqBA9DTHNXo8QOJce92pEMD92/Gvs
   hxPmuy194CB1w44fMsiq5Bnh7f9HigRwYu9ba+Z73mkZJTk/djl2bDV+Q
   g==;
X-CSE-ConnectionGUID: CCCGkReDTXGBHf1ZH0NJCQ==
X-CSE-MsgGUID: 7CBr3vvfRAW4V7dz8THKpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43240986"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="43240986"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 09:03:13 -0700
X-CSE-ConnectionGUID: CVPcKQ0jRjW7UNLmHtaUbQ==
X-CSE-MsgGUID: mhtgn21rSZuwusaAqIQDYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="122470767"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 09:03:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tuCvd-00000003LyD-3atp;
	Mon, 17 Mar 2025 18:03:01 +0200
Date: Mon, 17 Mar 2025 18:03:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v8 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <Z9hHtTzUQ4CE8AB_@smile.fi.intel.com>
References: <cover.1742225817.git.mazziesaccount@gmail.com>
 <78d33ea9a795abdb2c5a4c606d48593e827ca59e.1742225817.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78d33ea9a795abdb2c5a4c606d48593e827ca59e.1742225817.git.mazziesaccount@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 05:51:14PM +0200, Matti Vaittinen wrote:
> The new devm_iio_adc_device_alloc_chaninfo_se() -helper is intended to
> help drivers avoid open-coding the for_each_node -loop for getting the
> channel IDs. The helper provides standard way to detect the ADC channel
> nodes (by the node name), and a standard way to convert the "reg"
> -properties to channel identification numbers, used in the struct
> iio_chan_spec. Furthermore, the helper can optionally check the found
> channel IDs are smaller than given maximum. This is useful for callers
> which later use the IDs for example for indexing a channel data array.
> 
> The original driver treated all found child nodes as channel nodes. The
> new helper requires channel nodes to be named channel[@N]. This should
> help avoid problems with devices which may contain also other but ADC
> child nodes. Quick grep from arch/* with the sun20i-gpadc's compatible
> string didn't reveal any in-tree .dts with channel nodes named
> otherwise. Also, same grep shows all the in-tree .dts seem to have
> channel IDs between 0..num of channels.
> 
> Use the new helper.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


