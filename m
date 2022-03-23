Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93607FC
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Mar 2022 18:39:56 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id v75so2559955oie.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Mar 2022 11:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6IJ7cycfuyyCexwHrRxoU1gZ16ubOu37ElUcjTsxXYM=;
        b=GmY6+R3+lsd/VivU4BSVExM22kuYExXmIX6yZZcDfMQe/bNnT4dP5vMoR/o6bmf/nE
         KC/WEu6wcVBWBMsyzSyz8ccA4dmPHKkKF8pE3GTAx7KrHAVpNJovgQcIw9Q5oDUob5hN
         0aWIT3Ru+uX4Xu8U75IuGSryKch1SivU0ierVmlIy2tg+c3jomO/qCEBw6JjkfYgQYxr
         A+yqMrMjIataQ922XV19MULDBcC/C3S//W4FUA+uMchS8V76rvK6+LjELwZSybrlPrJg
         oWQM0WIhdknpA15Z3AFAJCChdnA5ojJhgI2TIlFVLTCp1qI6op2CUUZGgwa+re8/pNj1
         YkSA==
X-Gm-Message-State: AOAM531dSvOIW+8ek3icOTKvQ8KrI7wXfgOjEQaVHJ4kr5uCmP2TwH6V
	+JAhJUDNyQBAvdXXssWX3w==
X-Google-Smtp-Source: ABdhPJyHW8ZDlvYfWru61+0oXURh2510vlMRwO3N0Pu7nI+5UqvWri99WhDWPAfwIGOqucmbQllVuw==
X-Received: by 2002:a05:6808:23c8:b0:2ec:cf83:612a with SMTP id bq8-20020a05680823c800b002eccf83612amr5479019oib.255.1648060795836;
        Wed, 23 Mar 2022 11:39:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j145-20020acaeb97000000b002d9f37166c1sm279431oih.17.2022.03.23.11.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 11:39:55 -0700 (PDT)
Received: (nullmailer pid 229564 invoked by uid 1000);
	Wed, 23 Mar 2022 18:39:54 -0000
Date: Wed, 23 Mar 2022 13:39:54 -0500
From: Rob Herring <robh@kernel.org>
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: sunxi: add A20-olinuxino-lime2
 Revisions G/G1/G2
Message-ID: <Yjtpev468IWa59fx@robh.at.kernel.org>
References: <20220315095244.29718-1-ynezz@true.cz>
 <20220315095244.29718-4-ynezz@true.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220315095244.29718-4-ynezz@true.cz>

On Tue, 15 Mar 2022 10:52:44 +0100, Petr Štetiar wrote:
> Add DT bindings for A20-olinuxino-lime2 Revisions G/G1/G2 boards.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Petr Štetiar <ynezz@true.cz>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
