Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1F87F
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Aug 2022 09:03:05 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id v7so7287391ljh.5
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Aug 2022 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zhuL9i9TDotSF+bYGEKALdF6iapdw0N+X68W860otKY=;
        b=OtFEcrvRm+vgI4ZkufiqiWnFlo6Oxs8kf1KZKPok63gKbrJrpSxzI+OzL5Hwb5louN
         FfW8ajOxcSSBVrxw3mF7Ihsi/8YK0HavLwyZ20zRyhpjtBCpwe8eqCQVenrQoajJqnjG
         6eVF+rMJunBzJDdihBe/uIQ8PhRaYPVAmFpbw/XU+sS8/vyI4Fg9+7dqZFlXj4WBJULI
         gur7x4m9gecmh4tFCEKyHKHj56s5wSCwYVxVQfXvzIkSU9FmnU7raRRE7sbgSjqh4JZv
         8ENKXuverbEFp6l4A0zsPhEkGb8OzRt9FhRmE4sblsY4ONPEUwL1z1g74TG52fJQy/77
         /2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zhuL9i9TDotSF+bYGEKALdF6iapdw0N+X68W860otKY=;
        b=EsCKbkbrmj7J3SCqYA2SyK5+0yTHr1TDU9+obQxfI+XoZUZt0tcqtOvsfyCmJgg/KP
         E8fHn8Ft6XDcSBdrJKEp/GhmT2lWk5ZPO3yx5Z9NuIuEV5sF6Mbzqpj8H0AItJk+jajj
         Q4IUBxcptN3O2tSHLK1z7FoPT8tM8+m7IQ7lGF9tnsuB3zM+8BCyFHBmeZJCGF+EyS6x
         owXqQoQXosK5xUaJMWbHRZ9uRFHR0r4j+ec2CLPkqLjXFwjYhdJqgUGp3BZ65OLjkGAu
         GDG4ollMDmQwCInALSs3EA86WeXW1PmVo/mRpBi14IDEXmuK7Aq04tQhYW52WLWAtdPy
         y65g==
X-Gm-Message-State: AJIora9d8q6CZD2Eki6i4W0VnmtE4Edhx/VCEmlYG1slJxZEuxdtSXH6
	KpE7PEmyBpnD9Dr+gpRSuS87Qw==
X-Google-Smtp-Source: AGRyM1siLBI+/dKc8L+pZh7GSlKLEDSw9zaPcBpli8DOQcLzlQt+ViI/atXXJs5olL7tsXdZHr56qQ==
X-Received: by 2002:a05:651c:1542:b0:249:5d86:3164 with SMTP id y2-20020a05651c154200b002495d863164mr6169530ljp.500.1659430983581;
        Tue, 02 Aug 2022 02:03:03 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id u13-20020ac248ad000000b0048af7e1b268sm778067lfg.210.2022.08.02.02.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 02:03:03 -0700 (PDT)
Message-ID: <ec49a891-a333-85a9-ec2e-e3d7e1599282@linaro.org>
Date: Tue, 2 Aug 2022 11:03:01 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/9] dt-bindings: sram: sunxi-sram: Add D1 compatible
 string
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>,
 Icenowy Zheng <icenowy@aosc.io>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220801030509.21966-1-samuel@sholland.org>
 <20220801030509.21966-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220801030509.21966-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/08/2022 05:05, Samuel Holland wrote:
> D1 needs to export a register for managing some LDO regulators, so it
> needs a unique compatible.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../bindings/sram/allwinner,sun4i-a10-system-control.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> index 1c426c211e36..ab6e95a97c9f 100644
> --- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> +++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> @@ -39,6 +39,7 @@ properties:
>        - items:
>            - const: allwinner,sun8i-r40-system-control
>            - const: allwinner,sun4i-a10-system-control
> +      - const: allwinner,sun20i-d1-system-control
>        - const: allwinner,sun50i-a64-sram-controller
>          deprecated: true
>        - const: allwinner,sun50i-a64-system-control

Please first clean up the compatible list. All these should be one enum.
You have duplicated entries for two-compatible cases. Also enum. Don't
grow this pattern...


Best regards,
Krzysztof
