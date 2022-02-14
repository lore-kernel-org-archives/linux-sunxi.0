Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FC9A2C
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 17:19:27 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d187so30323046pfa.10
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 09:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=UlEoY4gUMCf+dGZF5OFEMsNszRaKi2NA9sVTb7hg2Q0=;
        b=Ae4U2rn/YgQgOSiyBw4kGAmri+C7D120xX2o4jTRqLmVZIwA9orrp82PFXVyOLe88t
         5T5LS8Yywqq1yrpCVB7G4GG5FYZQUDJDm53OLiwGHyGy8+PzEh/ltOv9sdjQsLOQ37BW
         K9jUAGGyAGbO8m/d9ADpTfTiEDDicGmysucCnySqoNkUDMyL2sf0KwApIjlpCOBKh7LG
         PwLn7yzu096BJFsZbMkywa8qC5bLUChdLXtHANsVKuws7eixe2FC3CD/XVIIbRv0GFH4
         8aL24++hGBw17OPlB9PFW8aJifALKZ5y0EbTPSEC7kOrBTt+Y+9DY5uTdqXJzHsuvFjt
         Fi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UlEoY4gUMCf+dGZF5OFEMsNszRaKi2NA9sVTb7hg2Q0=;
        b=QpAyxyWikbf0psnT+Fxs98fkz1RqssiUW3o9V2so+mWt5adMfl37ObClzfohWk5u9r
         LgRDFZyjFUqbFkseFa8/3/WeFZGVdK76swxDJ0SIprJSWm5vnZ/bzjPobzUkSBC02Kh6
         dVUgsBE8w7Utl6NvTwD6pX48qVHa87RtMcJDtFj/U8kUpdexTJHWc+yS+ytWS4tCJU00
         7q5aov1pVLNQrjini6ZbjL5Bi8YxijnuSB6XQep4HemiM84oNsxQhjgONCE5fzoHPO7U
         pZpGfBqaR2/oTFao95MegaY/auZ5oH0hxJ1rvoCPWsj5R9SjLsVgvNnSPxRMUrFUbm43
         XSvA==
X-Gm-Message-State: AOAM53234U8ZL4EepftTVXiALy6GrY8uuC23wMvcwrCy4EOog8ZuddzN
	Tnjc9yB319awZFRSaPEWuZ4=
X-Google-Smtp-Source: ABdhPJzbAW43zE1Qfnv6bnjeH7rBFCX7yXcNUn2pVO8yLoL7oe86rRsSHL23eDM2HIDNmODSHPh2sQ==
X-Received: by 2002:a63:2a51:: with SMTP id q78mr4148pgq.239.1644859166687;
        Mon, 14 Feb 2022 09:19:26 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id bd34sm5276481pfb.73.2022.02.14.09.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 09:19:26 -0800 (PST)
Subject: Re: [PATCH 10/15] dt-bindings: pwm: brcm,bcm7038: do not require
 pwm-cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>,
 Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
 <20220214081605.161394-10-krzysztof.kozlowski@canonical.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a8d3ea6e-c9f8-e5e4-7cbd-71e0c814db0a@gmail.com>
Date: Mon, 14 Feb 2022 09:19:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220214081605.161394-10-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/14/22 12:16 AM, Krzysztof Kozlowski wrote:
> pwm-cells are already required by pwm.yaml schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
