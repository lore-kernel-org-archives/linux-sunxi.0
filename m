Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265530;
	b=PPUKWzubxRYPxUImZAgdAJi7o89D/DxmzHtYZghr0qE3f+JO5J/S5LJQVTSXsAx+O/6z
	 5+Se9KqdkDTLyrrq9o3pEYu/vpGz3HTCenRWn9GGBL/aEUPv33s364xrb0VSimasxsSRR
	 wrjZPqfywoTOAQvd8HcYPVbcEYu+nmxKmOwXvoFA1JjuAB1ZIj7GKukALiClrv67BcYPa
	 gn+sPiwkZEcmPBUv5BJ1juI3ty/KIry3lYbHyqG9SPY47NNoOZyMOChjst17/6cPlRbLV
	 vFLofVUW4uN3M1qZckyFphcJHGHkpwn9hEzgCJAoYsQqgZzq2G65w4m69NUi7r7ydfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=4FhdLPD0grYX+522WudA2QHSLtTJRmqNQOiiL/At1p0=;
	b=cVafAwYW5e1DK+Rkg9Kpj3/ZmVrDs9GjhIDwUzY9zKgYUKdoBrk3dGBdBGUBG2dffPPP
	 O/7uYNUWdJTaCPnlRXVi3h9JHpp09lbmK2ynTr7RD0nG2hQ2aLzmFooNYM731r/LUlAKR
	 PqgHBYcSk74xX8iOzIer0UInYCovPxnBS+3oU+gEnXRN01+jF4ayz3t34bV6h2p0wRwpA
	 O+W3qUgoUIWy/aNph8cGZpm4MSbJUxVkEBPK8JIYk8WVKNxh3fvtz7TM6qkN+UznSKzJI
	 icAW9u5SBNVcbzRud3iBRXKg8wzmKis5/txz3n1qFIMrWUx/aVWjC9rPJO3DhMREYng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iLw1eOTy;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1170606A31C
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 23:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1170606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iLw1eOTy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794265529; x=1825801529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fA/YuYOZqr8nX95JQI9ayGBQbBahOSJO/lfwcBjsiT4=;
  b=iLw1eOTy0noAurC6KoRem7YOWWcx0Cd0jPmRx+JrXmoJ/L2nE+GreIXR
   dTVJyjNkW4c90To2LpbQZ6Y+8AMkbEX5HPMFeR7lzIDtzHRIEFut7cecO
   v5zTelqmvch6bwPHy7vwF8E2tBGc+tCv5XtrYT9HtxfWrwWFXvYJHw3lQ
   T50b0vl8iI8nQDg9Zk79o9WeSkJ5kAOET1NvzTXv4yayNVw7rXTq6XrqX
   AlLyRR31DyR3yLVTNjOzatTP9HfjYRRDyCnvSQetpTg2nOCYDMv/K8tjh
   SlX0W13HEYc2a7P8QkWC8oCT2RJ/JUU45d/DhQ6d74Y3lW+Unv/ZRjvw8
   A==;
X-CSE-ConnectionGUID: IFgM0ap+SJezJGGojrWaug==
X-CSE-MsgGUID: T/Erom4NRhWoljTc3BDFeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3029787"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3029787"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:05:29 -0800
X-CSE-ConnectionGUID: O1fhqldaSzi1N7PVHOdtOg==
X-CSE-MsgGUID: XivK/JkIRVmktnl1NeCaEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9845093"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:05:24 -0800
Date: Tue, 10 Nov 2026 01:05:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v8 01/11] serial: 8250_dw: allow port setup to report
 errors
Message-ID: <avJRsij5P7Ch3tqE@ashevche-desk.local>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
 <20261105-submit-h616-uart-fifo-v1-v8-1-14024d2b184b@gmail.com>
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
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-1-14024d2b184b@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 01:52:02PM -0700, James Hilliard wrote:
> Return a status from dw8250_setup_port() and propagate failures through
> the DW and LPSS probe paths before registering the UART. Use the existing
> LPSS cleanup path to release board resources and IRQ vectors on failure.
> 
> Keep the current setup behavior by returning zero on both successful
> paths. This separates error propagation from the configuration validation
> that will use it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
after addressing below piece.

...

> -	if (!data->skip_autocfg)
> -		dw8250_setup_port(p);
> +	if (!data->skip_autocfg) {
> +		err = dw8250_setup_port(p);
> +		if (err)
> +			return err;
> +	}

No, don't change it here, the return value will be simply ignored until the
change that will make use of it.

-- 
With Best Regards,
Andy Shevchenko


