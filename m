Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BFD1EA01
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Nov 2022 17:28:16 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id cb2-20020a056830618200b00661b6e5dcd8so10653663otb.8
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Nov 2022 10:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqCzEBWHfRJKOVrjvRDrbpehwYKjEu0v5b3GqzN9jbU=;
        b=Jt2vAc77qBrdW60Sn8fnJldXFXKjIg9sd5A//xLinKytN5+KQD2B+jszw3m6gCykIp
         W65hRS9wwCp5frPEs1U1vycbT9Z61a3MJcQHX9WkA5bEru5UmA82vxzP57NCYr4FXtvM
         x6WBVbyIaOgoOEZvuJIIwmH6LB/D1zd6pvKS5YDv9jAahenNQUxiy+S0AOtrXmw1mrbU
         q8ZviS6W74WuSepHSCVcUWNLMDypEW7R2A47X9lZk2FqASPlt4RYa5P7W/kKBX5yEewb
         rk9EFbXcOl5UC2fgvfM23NX4/yhat7qeLzv2VpIxaQqrqfg2FVXHxYMK1Vkkwa94fFyn
         tSMA==
X-Gm-Message-State: ACrzQf1/bHQSgv0mH57u5t9qz+gGftUrlEoR9GqsNq4irq+kfDEyEO31
	c+GjgkwzwGvcvCngW5coQQ==
X-Google-Smtp-Source: AMsMyM6GK0UM0orWhB2cZizHEHkBZ7CzAtASvxOwDdQDkf6h4WUzpMgdMQjvG7jVc/7eozWfC80ggA==
X-Received: by 2002:a05:6830:1151:b0:66c:64d6:4907 with SMTP id x17-20020a056830115100b0066c64d64907mr6315886otq.43.1667410095758;
        Wed, 02 Nov 2022 10:28:15 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z2-20020a9d65c2000000b00661946468c6sm5169404oth.31.2022.11.02.10.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:28:15 -0700 (PDT)
Received: (nullmailer pid 4191359 invoked by uid 1000);
	Wed, 02 Nov 2022 17:28:17 -0000
Date: Wed, 2 Nov 2022 12:28:17 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Icenowy Zheng <uwu@icenowy.me>, Gregory CLEMENT <gregory.clement@bootlin.com>, linux-i2c@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/9] dt-bindings: i2c: mv64xxx: Add F1C100s compatible
 string
Message-ID: <166741009657.4191304.7658814383312560291.robh@kernel.org>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
 <20221101141658.3631342-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101141658.3631342-4-andre.przywara@arm.com>


On Tue, 01 Nov 2022 14:16:52 +0000, Andre Przywara wrote:
> The I2C controller IP used in the Allwinner F1C100s series of SoCs is
> compatible with the ones used in the other Allwinner SoCs.
> 
> Add an F1C100s specific compatible string to the list of existing names.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
