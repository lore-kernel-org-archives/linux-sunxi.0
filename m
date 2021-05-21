Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F070
	for <linux-sunxi@lists.linux.dev>; Fri, 21 May 2021 01:40:31 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 80-20020a9d08560000b0290333e9d2b247so6095334oty.7
        for <linux-sunxi@lists.linux.dev>; Thu, 20 May 2021 18:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0BIMIr+vPahmBauXRfzt2P0Ds58ZfqNsm2Ee2f6z5uE=;
        b=hCpndqeYtI2kvWOiOp+FnLAwCXcijtaZbvLe6UNt7j0IFOVFWJltucHo8G2F6MH01F
         NpTP89r4SXS/59ys/5YnuU5ZYc/P6yIPOyBSljzWcwApvuONjuQSBRfuG9N4rKiH8iYK
         V3BZ6OTcegw2y4safgIaGwosA4SlKO/WsEjOdn4F1vlUUf1b8rSn7SxcMmRBvLFk9HwH
         wrxLDbn7jlv1zmuZERmPWZOYKqLb5WhvOOxq7DZZzKHq7TaYr7u7j8PRPtXRANeb/g6P
         cLvCTmoovTk/SRhWJ04d2UmS90BYE7XqDMnNZmQYUfD+ImQoEG+gDUp7TM+159E85arj
         hkUg==
X-Gm-Message-State: AOAM5319rbMSYK/Fren5hihoRvlH58rAwU9Sk7fNtoiAzWhnZgmDZjG+
	l7q2T3JwrhAibXeG2dBncYlckUQxVg==
X-Google-Smtp-Source: ABdhPJxNlR4PrBb+IozGsfyNMDszEoRAZvLptKfs818Bvw2pDWjPOw0VdaTzTKxTP2dLdHeFJSTf6w==
X-Received: by 2002:a05:6830:10c9:: with SMTP id z9mr6253358oto.275.1621561230643;
        Thu, 20 May 2021 18:40:30 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v19sm1015441otk.22.2021.05.20.18.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:40:30 -0700 (PDT)
Received: (nullmailer pid 2462099 invoked by uid 1000);
	Fri, 21 May 2021 01:40:28 -0000
Date: Thu, 20 May 2021 20:40:28 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, linux-sunxi@googlegroups.com, linux-usb@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev, Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v6 09/17] dt-bindings: usb: sunxi-musb: Add H616
 compatible string
Message-ID: <20210521014028.GA2462070@robh.at.kernel.org>
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-10-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519104152.21119-10-andre.przywara@arm.com>

On Wed, 19 May 2021 11:41:44 +0100, Andre Przywara wrote:
> The H616 MUSB peripheral is compatible to the H3 one (8 endpoints).
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
