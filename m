Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176218;
	b=4lYAl2dQ+PwMDbswo+iCpS3ihnEupi+YIuLRGHBkf2QyjFSb01Say6Dzp+CvgGQGBGBb
	 KpJFGmXs7H0oTaSlbhwsAIDcQun9cUjfP32VHPgQjKkT93LARtm1T3CSAzMPpU83gZLRL
	 jNBSvRJnSK5lUVRHFdVCTC7N4S5vf6/MXtIieRlm4CmedABwz0OI6x4lfEjJEb68cwRCR
	 NXxy0FlvtyKjGMgfbOl8O+3w89jp4PWJHxArBIcxtIRtZBZ7Vq9v10PoE5RWukl0gGBm2
	 4co1cYHAqcpwSyb9OgIQOzqG5ZZq2X5+Pfac3TwCZZXm3DDnZ681axWj78Cf2/V84cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176218;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=tOHeyNRvmbXusJKMq6HVQABJtMt41LHGwmGBsrUeMzk=;
	b=uczzla3oW6yW7Nvq3gLCXGFoZWpNATtWwAKR5rSqWRpxOTOzk4IMDn934ZmlPtmISZYJ
	 bebBUYgRDOubRkeWk2e9QJ/8nsV3FJrRRc6PMu6L1c3xBnL5UrjPm65EhbVvIQcL2piPt
	 Cjw8CG2S/CAeojAnexgRzQea6ptWkHpzXewVQ/JaA/vfY+HuuK9H/Ksnn5J2ioRjuiScN
	 I+4exV4IHajuj5XW0uvlGLgkeZ7GeleLcD4jFh8v4WQQOkB7VAQIrnt8X3NaeIyXGYJaH
	 4NFGsh+gRoEs+lIf111bQfcOj1rK567PpbxqGn67UDf34xESs3pFwoyFSvz9D/YiBQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1IsCY3k;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C001606A321
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Oct 2026 08:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C001606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1IsCY3k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793176217; x=1824712217;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+VrEP1WtzBFvz1LUMzocRw+T/DgCiiZIdHezI1jy7fM=;
  b=j1IsCY3koGy0dKjExUNFNfhBSRv1crBtnNHEd9RiX8Jn10ECHMZEBpiO
   kizUVFjMfys1CpjNshw5rBnIl7WMhltlqMy1hmY/F8FsJyyLVpvbc4enm
   pvNyVSlhoUil3iOIz77DODXXrULt7qzWhF2jgneITDc4Nkk8mVuo2M6Gi
   j5RRyD3ceEkaC77eIP5/8qc08hVWfVwGJXRIuve3uWjxGmfY9GPch7k3K
   J1FkD0wRzw0CcZ3ItJUEjbMSmMbpZx+GjoWqfkdhi/BwOexMVK/qYgJzx
   iNCRyTAHO8IcdAT77nmJzAYWzNeL6DUXTC4bAtygbRqUwYVX1IYELmcv7
   A==;
X-CSE-ConnectionGUID: PUZg1v07RNKITCwyJwo+UA==
X-CSE-MsgGUID: XBYxRtd3QbidDjz9lfcVEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1911572"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1911572"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:30:16 -0700
X-CSE-ConnectionGUID: DUrcjuXNSSKkOJTwbdT4hg==
X-CSE-MsgGUID: JUePD06ET02YdR9Jmycmmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6600853"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:30:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Oct 2026 10:30:07 +0200 (EET)
To: James Hilliard <james.hilliard1@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 2/5] serial: 8250: share the RX trigger conversion
 helper
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
Message-ID: <805ee11d-c385-f509-456a-35205d8963b4@linux.intel.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com> <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Oct 2026, James Hilliard wrote:

> Extract the receive-trigger threshold search into serial8250_bytes_to_fcr()
> so drivers with per-port threshold tables can use the same conversion as
> the generic 8250 implementation.
> 
> Include the unsupported-table check in the helper and preserve the existing
> nearest-lower selection and highest-encoding fallback.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/tty/serial/8250/8250.h      | 16 ++++++++++++++++
>  drivers/tty/serial/8250/8250_port.c | 12 +-----------
>  2 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> index 21ed9c41b751..195ed58a2231 100644
> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/bits.h>
> +#include <linux/errno.h>
>  #include <linux/serial_8250.h>
>  #include <linux/serial_core.h>
>  #include <linux/dmaengine.h>
> @@ -73,6 +74,21 @@ struct serial8250_config {
>  	unsigned int	flags;
>  };
>  
> +static inline int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes,

This looks way to complicated to be inline function so I think it should 
be kept in 8250_port and exported from there.

> +					  unsigned char bytes)
> +{
> +	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
> +		return -EOPNOTSUPP;
> +
> +	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
> +		if (bytes < rxtrig_bytes[i])
> +			/* Use the nearest lower value */
> +			return (i - 1) << UART_FCR_R_TRIG_SHIFT;
> +	}
> +
> +	return UART_FCR_R_TRIG_11;
> +}
> +
>  enum uart_port_type {
>  	/* Internal 8250 only */
>  	UART_PORT_AIROHA		= 124,
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index 36b2b0a2c05c..c332963dc2ed 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -3018,18 +3018,8 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
>  static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
>  {
>  	const struct serial8250_config *conf_type = &uart_config[up->port.type];
> -	int i;
>  
> -	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
> -		return -EOPNOTSUPP;
> -
> -	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
> -		if (bytes < conf_type->rxtrig_bytes[i])
> -			/* Use the nearest lower value */
> -			return (--i) << UART_FCR_R_TRIG_SHIFT;
> -	}
> -
> -	return UART_FCR_R_TRIG_11;
> +	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
>  }
>  
>  static int do_get_rxtrig(struct tty_port *port)
> 
> 

-- 
 i.

