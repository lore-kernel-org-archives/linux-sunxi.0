Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493057F4
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 20:57:06 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id k15so3377895iok.5
        for <linux-sunxi@lists.linux.dev>; Fri, 01 Jul 2022 13:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xgE/JcMImFsLHC9kd8+2fcNfM7vDxsP6gVBtPDttJ1Y=;
        b=uq6yFHyXekMVKirJCOWZ0l1UGDLOMGN5D/P2WEGdriL8NumWrBQpuOx8XP42Ygcarw
         BtBTuxDUgKVfOMwsavqxLhg2GOtW6bpRJlIHyVQQgmM39Ff+YaYDe9EK5vRLEUqnNAQi
         4jAi7vXjBrIP17CDdOFSiDgQXATyGsVpbRYOmps4v+7Tu9FQ4/few4KrdqyaMYRftVh3
         IoCt4RRDLn+Oyaa/f+IKvGDgfFaEYcn8Um1fqynB6EhuXSJ4IFIsYEs3vYa0097TQGnw
         j3vzjuj/50EXKhOGkBHPQdz0bw87IaC9kstYTBUbDLpgiBp7ey+pwlGpE8L0NpyDKmC4
         YMcg==
X-Gm-Message-State: AJIora9ISTb3cbuFjfJVOLD2d5hkrFg5x0+q0I4s7htnWJ5BfguJ1qr1
	wFMGni0utK93ws7143kSiw==
X-Google-Smtp-Source: AGRyM1vBsdqcy5YkIu5jY2aKYkyMTBVIaMSTTEbsoJvFJCBb92KYANiqzH2w4D61p9EBRSIzvZZHOQ==
X-Received: by 2002:a5d:8485:0:b0:672:76d6:3848 with SMTP id t5-20020a5d8485000000b0067276d63848mr8209832iom.18.1656709025310;
        Fri, 01 Jul 2022 13:57:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j12-20020a6b794c000000b0067275a52928sm10681358iop.9.2022.07.01.13.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 13:57:04 -0700 (PDT)
Received: (nullmailer pid 1515827 invoked by uid 1000);
	Fri, 01 Jul 2022 20:57:03 -0000
Date: Fri, 1 Jul 2022 14:57:03 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v12 2/7] dt-bindings: pinctrl: sunxi: Make interrupts
 optional
Message-ID: <20220701205703.GA1515763-robh@kernel.org>
References: <20220701112453.2310722-1-andre.przywara@arm.com>
 <20220701112453.2310722-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701112453.2310722-3-andre.przywara@arm.com>

On Fri, 01 Jul 2022 12:24:48 +0100, Andre Przywara wrote:
> The R_PIO pinctrl device on the Allwinner H616 SoC does not have an
> interrupt (it features only two pins).
> However the binding requires at least naming one upstream interrupt,
> plus the #interrupt-cells and interrupt-controller properties.
> 
> Drop the unconditional requirement for the interrupt properties, and
> make them dependent on being not this particular pinctrl device.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml      | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
