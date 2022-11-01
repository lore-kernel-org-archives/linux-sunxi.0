Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31EE7B
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Nov 2022 01:03:27 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id m204so2802070oib.6
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 18:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkcBrIA7oBQ5mjHwd2UEcYrTi2K7pE4sTmK8J9yJ3xk=;
        b=sEy8uwEgDJCWyNY8g98hIklqkslRw0LVjQZ2um+0XwCfMCLKwdRftIyLgz/E8XBUNS
         1H68blIV1Gl/hRi8+X+6siTuN4hOYDmZozg4vCEUzlxokt+dK/KuYhxv36nd7RNkO/TH
         w/zxc507gwXQL5q6burhaBSpMszyKvjN1N+oSTbPaMU44wxfiFABtJD0lqTW1/u07clP
         2S0sqvjxRDwv3PbvuPvMkrvtQLhQoUIoxhnbUVjq8caaq3sLcC2A2OGofmzpqs0TmeU3
         VImKjlTp5fSHr1iIolldFXm/eegbgWutIxyuqbCYQwlRF7eui09kbXSSWLtV0hevBVtF
         LUXg==
X-Gm-Message-State: ACrzQf0O45f8K/3F5o9DsKCC5O+7WsNDURxI2u8UkcEA42UQvSMZOgU9
	eMkD+GeHK1nb2X0Z/cpUAg==
X-Google-Smtp-Source: AMsMyM5Hm6wz1VL2aBS7VdPj2bSUEvAruPZvs7foxPpmncN/mwOsDpLRKL8oEo1akGDpohnZxJPP6w==
X-Received: by 2002:a05:6808:8d2:b0:354:7fd4:f17b with SMTP id k18-20020a05680808d200b003547fd4f17bmr27480oij.221.1667264606700;
        Mon, 31 Oct 2022 18:03:26 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g12-20020a056870a70c00b0010d7242b623sm3825007oam.21.2022.10.31.18.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 18:03:26 -0700 (PDT)
Received: (nullmailer pid 4030032 invoked by uid 1000);
	Tue, 01 Nov 2022 01:03:27 -0000
Date: Mon, 31 Oct 2022 20:03:27 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>, linux-usb@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Karl Kurbjun <karl.os@veroson.com>, Vinod Koul <vkoul@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-sunxi@lists.linux.dev, Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: Add special clock for Allwinner
 H616 PHY
Message-ID: <166726460732.4029973.16304467789451504367.robh@kernel.org>
References: <20221031111358.3387297-1-andre.przywara@arm.com>
 <20221031111358.3387297-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031111358.3387297-3-andre.przywara@arm.com>


On Mon, 31 Oct 2022 11:13:53 +0000, Andre Przywara wrote:
> The USB PHY IP in the Allwinner H616 SoC requires a quirk that involves
> some resources from port 2's PHY and HCI IP. In particular the PMU clock
> for port 2 must be surely ungated before accessing the REG_HCI_PHY_CTL
> register of port 2. To allow each USB port to be controlled
> independently of port 2, we need a handle to that particular PMU clock
> in the *PHY* node, as the HCI and PHY part might be handled by separate
> drivers.
> 
> Add that clock to the requirements of the H616 PHY binding, so that a
> PHY driver can apply the quirk in isolation, without requiring help from
> port 2's HCI driver.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../phy/allwinner,sun8i-h3-usb-phy.yaml       | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
