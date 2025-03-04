Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0921FFC66
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Mar 2025 12:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741090074; cv=none; b=k+fFdhmJWlqGv6ocvm6OkArGfGzN2HvbV72A+wlT9L2l3ihRx8/2pK/k5LEcLBnW2SXP12JP+gFdInlB12hopz/87vOM64HIgKxKol092scj3lblXs2gKS8oGMGPNlUfJdP2Iz4DzMre0ae+cNDOHB6aWTSNlzWqT6f3TV5tmH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741090074; c=relaxed/simple;
	bh=MZy0VWiaiUcAOLUZr1EitCj53YlBljkRvHR7tDzANe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZ91nflJ6+O0DuCx4XStF74lpKu/eS2FuFeJUPQR6BEa8yj7Ro3R/eWKGZ+U/f2qpOzQpk9t1PWBNNs760LgJEc8kEPaaP/U9xOpjAQK+QQbr+dPbK82bFISvMOdqpKw6gwo53lndi7ERUyirKxdJOsLV2tN56W3vfJpo24OIak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1blYOCS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1blYOCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741090072; x=1772626072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MZy0VWiaiUcAOLUZr1EitCj53YlBljkRvHR7tDzANe4=;
  b=d1blYOCSzAr6UZhXdN9RWG0JCDeQ2oG4nTxrDmyN13l01HL6N9VGi5GU
   PGtbaoVFuc/y+W97Oy4ZXaDL0dlY1zoYeKpebmbYPFp9zdB9s3TyR85MS
   Q9RUU7/CGAsXFl5axyXn6h2SIsMM4PNeSabvjp6MYuy+kwcSinaEE188a
   xTRdiPTpNsT06Vl1QEDYDIOuxIwR2AVMuIbwKz5Eh0EjgPSQbe0aBvAof
   2oelAnlIj+ZPwWcYy71SY7vyB2OQLBewV84SAGGKasNp0E/OwC74Q0mVZ
   5y5EZ4yyuCU8beTKh4/OAizFjdbzi/ggz9lHtNGlj+HuJ2JCILPz4DIcL
   Q==;
X-CSE-ConnectionGUID: Z1EXEm1KSa6tX/kpWj/5wg==
X-CSE-MsgGUID: 1EvdxP0ERiaym2NX88jSeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45930044"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="45930044"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 04:07:52 -0800
X-CSE-ConnectionGUID: LzJzP827Tnuswzqwqylwxg==
X-CSE-MsgGUID: 40ygOT6kTlyfDKAMKfgDBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118352213"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 04:07:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tpR3n-0000000H7I7-1M7c;
	Tue, 04 Mar 2025 14:07:43 +0200
Date: Tue, 4 Mar 2025 14:07:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <Z8btDzggD29xtaAo@smile.fi.intel.com>
References: <cover.1740993491.git.mazziesaccount@gmail.com>
 <e71c63c2f61135f9a8c7884525aab2c48f1e84c2.1740993491.git.mazziesaccount@gmail.com>
 <CAMknhBGQaqFZJsPAoauZL4S5MYtN05EOQ-BO2vw5gH+Z2RLOhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMknhBGQaqFZJsPAoauZL4S5MYtN05EOQ-BO2vw5gH+Z2RLOhw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 04, 2025 at 10:25:03AM +0100, David Lechner wrote:
> On Mon, Mar 3, 2025 at 12:32 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:

...

> There are some different opinions on this, but on the last patch I did
> introducing a new namespace,

> the consensus

Hmm... I may not call that "the consensus"...

> seems to be that putting
> the MODULE_IMPORT_NS() in the header file was convenient so that users
> of the API don't have to remember to both include the header and add
> the import macro.

Which I am against because it will diminish the point of prevention of
the APIs abuse along with a potential to have the stale headers in
the file when the code is moved somewhere else..

So, please do not do that. We have only two abusers currently:
the PWM and SPI OFFLOAD.

-- 
With Best Regards,
Andy Shevchenko


