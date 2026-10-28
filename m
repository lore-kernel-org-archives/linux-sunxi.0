Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180263;
	b=1ESMZtr/8ytlcLKFJKD7N8wo0oEm2ZZjgAq6JimuWUj66yuXSXljDMowfsC+57t222x4
	 Cx7KrHbZYiw0sAPo/7Ehnf/vynx5g3hTVWxyk8+oqQfnXMR9C9ztR3RoxjiCjTTzJKX0K
	 5AeI1TTinCBCyFfYaV96tZn7BuFUf2BZwAiJfhSMs8Ox6xpd6PLuL51abegLzPdiuhBwm
	 6pkNZ3W3HyUoAje2KbJE6pLCHrYMDOhRXGcZdr7JPX4YPd+VmMFZpZEadq8U6gQzt3Nm4
	 PGuHkRv2ggaJoxQ8jVvEbSpifCNdXFNAGq/sHkb+nP97w2IQENf/JwihoaT4DpQT4Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180263;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=PfFt5b3z6T/Dye1GZfdd20rqwauprOu5i4Wb9YAWnjE=;
	b=ZNKs4+BTvjlqq3aqKJXEam1bxkrs2qe/Vr1oBEvkPICkheJpr6kDUQy1LXOy9RHoivoa
	 /6DaFT4wzEQpFHmRwqQEXkjBKhpalvZ/AL7N9KQXmfXlzHK9rbVxRWCGK7NxYP4xumw5Y
	 g9K/87sh1Iox8Dei7+PuOhMoBx2xiUxUuFErJkv3LzeMcETbvKUALuC1AupUQ8NHqqsat
	 A/DrAcBnrJ3VPInVAKYyWYyp2XS3wqBkiRCK4Pb0TD6yh8OMDaURSJJZBoGsau007wszv
	 oFhaTx5zBrFn33EVBKRABbUKmariFb6HBeGBILk+cr3FBKuebnfCV6PS/8d9NXsSTeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PEwjczoW;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5B5606A31A
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Oct 2026 09:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD5B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PEwjczoW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793180263; x=1824716263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NIfnoQkZ4V2uVEMm5sBMRELn7o3bsPgvE78ZyMH/yWg=;
  b=PEwjczoWGVvFFou/B8QoDkQOeR0gLrqeJqyiu8YV79BcutacU01HY38Q
   +417BPHjTz209dbCMNqZNQpawBpkOHikEWheJmMPGJcjP0ASZXk36zNZW
   5NOIopKPjtTWNMdN4OBe0D7+j8AT9FpKFMb1tRdc7tN0kyrgm001FyVsL
   c5QBxW1Jqop7h62Xeq1FHeXUFFChsMwd5P4+CaXI7l5IqYuneR6CJbrHP
   qPe+LKaBIq1GFYoe0ImA9kK2dJIKlVeVe++h8EcWwoFZCj+jOYa9fWGJT
   8G+y3EmqITVD18a2ecc3PsFg7vEt/4+XYiigwIzHnALyTMLmy/hslZM0A
   w==;
X-CSE-ConnectionGUID: txVFZJJZQ8K3TZi5sIDLKA==
X-CSE-MsgGUID: lPHNZLOJQf6ykWWWOkMOkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1918968"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1918968"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:37:43 -0700
X-CSE-ConnectionGUID: sJn63pxHQrGnAsgSV+mzNQ==
X-CSE-MsgGUID: VpaTTqh/QwSf/O0Focra7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5142869"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:37:39 -0700
Date: Wed, 28 Oct 2026 11:37:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 2/5] serial: 8250: share the RX trigger conversion
 helper
Message-ID: <auHCYdZEqSh4RX7B@ashevche-desk.local>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 05:05:30PM -0600, James Hilliard wrote:
> Extract the receive-trigger threshold search into serial8250_bytes_to_fcr()
> so drivers with per-port threshold tables can use the same conversion as
> the generic 8250 implementation.
> 
> Include the unsupported-table check in the helper and preserve the existing
> nearest-lower selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


