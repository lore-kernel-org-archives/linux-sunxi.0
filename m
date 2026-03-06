Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C59234EF12;
	Fri,  6 Mar 2026 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791007; cv=none; b=c8B0jC+vJueg9ca6SjKgs3DKZTc/ToHotb8sDpKHETfjgkoDfbe3VGHHSizD1WQDpqyGPvt0qcDmDwl5h8OxyLUZUDSBqPzfTeQzUqWdwtb/YVgPByRxv284cFV3Hgs1Trs9AVPtb+p8F60mBhdqKWqYbOeTbqx8BlZbEVdcfqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791007; c=relaxed/simple;
	bh=M0XofkcuBdV1zkdsuj7RJ1maZEJbks9g3VqYv60iJnU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ea1+hzL+QxNHhc4NtkXjce7NRYEPUt7SEScJMnDDVSgt1WO7VwDxTfQZ6lC+uKKm7Mapo8x3lUsbLwvvFmKw+/+ksx5Ntnsb66twL7erxoY5VVCbkSx3L/C64b1yDTIUUFY5Y5asIiMHZ5I1Xlj6vhhvqoLzq3Gw6Om8WSMTLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=twuf04TV; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="twuf04TV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772791004; x=1804327004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M0XofkcuBdV1zkdsuj7RJ1maZEJbks9g3VqYv60iJnU=;
  b=twuf04TVYVqIu4COwwBJGikIziT4WVc4rAk8o62fHa8wMUUt9TAkhcPX
   ST/jufyAnvjuucNTVpi+aZKYZPfQnnyN96HCZvGx7+wb2RdjcwzCiKZJW
   SxRKb8Mk9MuAf8E7H1EiHZA7710ev+JtGXJBbDXJLCEKWd/jy387uXL9F
   gVBXSJFxHqhi/IFSOAnszB6gqk0JDKLiaL/eWOLdNEbsw99dCnXVMliAM
   qAQFnmcIphnqS+gWhC43gxQJ4GtHFiJU31ABivT7cNj9/uEm3FEkMLp/W
   YnB/izdu1UCQe3AdXaqDPOFYylldwmPe1yeJtUDtXO96DHDSf5jv0OPSa
   g==;
X-CSE-ConnectionGUID: kkklftjzTt+tmC5CjQykRw==
X-CSE-MsgGUID: y9hzzWGpTbWY5hyCt1eJ5w==
X-IronPort-AV: E=Sophos;i="6.23,104,1770620400"; 
   d="scan'208";a="54313383"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Mar 2026 02:56:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 6 Mar 2026 02:56:27 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 6 Mar 2026 02:56:22 -0700
Date: Fri, 6 Mar 2026 10:56:22 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: <linux-phy@lists.infradead.org>, Vinod Koul <vkoul@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, <dri-devel@lists.freedesktop.org>,
	<freedreno@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-can@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-ide@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<netdev@vger.kernel.org>, <spacemit@lists.linux.dev>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>
Subject: Re: [PATCH phy-next 07/22] net: lan969x: include missing <linux/of.h>
Message-ID: <20260306095622.rh3sje3wnexbdsqb@DEN-DL-M70577>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-8-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-8-vladimir.oltean@nxp.com>

> This file is calling of_property_read_u32() without including the proper
> header for it. It is provided by <linux/phy/phy.h>, which wants to get
> rid of it.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Daniel Machon <daniel.machon@microchip.com>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Steen Hegelund <Steen.Hegelund@microchip.com>
> ---
>  drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_rgmii.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_rgmii.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_rgmii.c
> index 4e422ca50828..249114b40c42 100644
> --- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_rgmii.c
> +++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_rgmii.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2024 Microchip Technology Inc. and its subsidiaries.
>   */
> 
> +#include <linux/of.h>
>  #include "lan969x.h"
> 
>  /* Tx clock selectors */
> --
> 2.43.0
>

Acked-by: Daniel Machon <daniel.machon@microchip.com>
