Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109182F33
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 02:44:20 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id s6so11715217qtc.4
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Mar 2022 18:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bhENzDdHrN2DokNz2Fb31SuHCi/J23yQsA1QonmyvpM=;
        b=MfQeaW6RS98qckng+Yug2t+xcoUC1O/VNi+lpGCTIMkOH5VHuRamycX0iOPeLnV4oX
         6G6uU9s0NeG0Klk87SOCMqus6vChkkZ99IBmqGE1F1TNh88QmiM+0JAxL8TlgUC6WJmx
         XT3NJfUEO6OtKEgwNEGA2pJYshfH1TYqM+BoKwTeNsodL7Dd8IGP5njNuGAcvHxXWnCu
         Xust+Gx87+NUxTCB3g1mBy7xqvIB5AfTJPdKiv8NYLn1w2vIpIO6AYDbWdZLYJ2RSIiW
         MaV8ecZ0Y7FrbsZfyZcAOdLlWjKKI4Bpm1TGEpwiyNVVkJOu8BkMXfJi8XD8cWZkKe5W
         UTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bhENzDdHrN2DokNz2Fb31SuHCi/J23yQsA1QonmyvpM=;
        b=gSFDF/5NOfP8R/xazHPFMYDzj/1Dv792IkKPDBdT7iXYXDYyuzGnflDWMkdqoXOUVL
         zKAKGpv4Hr1S8irOJmsUtEiJLTvmAoIs1SzwoACByeADyiIg7sCclBeQE7KIM15cx0IZ
         N6brKH9645l2PCeNHLmExAQTcjdIaJOnEOz4tbnKtf1ofysFcE+0NegPWO/B8xiAuTm1
         ZeJ56PqLVwhtWGktC9R5WwuUypmmOb/ycSzcJvMnrbyw1Dk6Px5aDFttwaQGeJrk8Kkk
         dojGI52O+8uE8PvZmA6gU5PtJRucJjhwIF1NQISwIRz0LIIx63V/UDxXFVgoq9RvJe13
         +olg==
X-Gm-Message-State: AOAM533PhO32sVDmz8P3LbWyqVMknuAPUjlbRYfnI7f+TgW2ISz2D2rA
	+uT5P//7Idkk6jY2KGler2I=
X-Google-Smtp-Source: ABdhPJwLq6+8oojHd8xy1pMytRtGVdrjymfBCXGMLkmCUNACI134C1OTjgzTX6MVwzaRtb/n/XkSjw==
X-Received: by 2002:a05:622a:410:b0:2df:f32b:c03e with SMTP id n16-20020a05622a041000b002dff32bc03emr12135104qtx.607.1646707459922;
        Mon, 07 Mar 2022 18:44:19 -0800 (PST)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v9-20020a05622a144900b002dfedb4dccasm10012267qtx.66.2022.03.07.18.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 18:44:19 -0800 (PST)
Message-ID: <526e09f8-6006-643a-70c6-d9b85e6cdb75@gmail.com>
Date: Mon, 7 Mar 2022 21:44:15 -0500
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 05/14] ARM: dts: suniv: F1C100: fix CPU node
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-6-andre.przywara@arm.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <20220307143421.1106209-6-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/7/22 09:34, Andre Przywara wrote:
> The /cpu node in the f1c100s.dtsi is not spec compliant, it's missing
> the reg property, and the corresponding address and size cells
> properties.
> 
> Add them to make the bindings check pass.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   arch/arm/boot/dts/suniv-f1c100s.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> index 922efd5e9457..43d342eaf661 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -29,9 +29,13 @@ osc32k: clk-32k {
>   	};
>   
>   	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>   		cpu {
cpu@0

also is memory node required?

Thanks,
jesse
>   			compatible = "arm,arm926ej-s";
>   			device_type = "cpu";
> +			reg = <0x0>;
>   		};
>   	};
>   
