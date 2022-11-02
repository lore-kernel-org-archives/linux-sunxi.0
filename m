Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C4E1EA01
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Nov 2022 17:28:43 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id n186so2583824oih.7
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Nov 2022 10:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaY2JRf7Qrs4BjLOms0a3yOv1naCkEtbz3Hhnyz2/Xo=;
        b=OwKkKz6Nq61pmVZLreRcTfxVUMuvROtRAjNxwuSqWMaOypTbm4SdQVEt2JKLNxkBRu
         r/1+eGJ0zgzixqD0ysamEDyL6i2d7mvQMSCDb/NpaN7AQcJdFZ2K4CqlrPJ3ZCyp4P5t
         BfLGdGepQ53F12oJbmJAJ6sueojA5lGvJaZj0J/cjkp+lE0P4ZhXQgo6W+camOuw+8cN
         crDgMM/N7l6fEn9QYKCELqiKrDYTeUToy4t4AXMczxGcyZ0jWFX90jebthv8bEy+Fh/E
         /hL0EFA6K1dBP1z0rXxkqMmoKMSHO3YxBCqexVKsm14udmv7Z+Lgx0YgsB6Jty2WyVax
         stKQ==
X-Gm-Message-State: ACrzQf1cusHKoAnRHo67GzZa/9Uk07/h2sFrMOprA2+Qe1iLG12L1Nqy
	/iJnmPY16JpU5Ju4dpLIUQ==
X-Google-Smtp-Source: AMsMyM7XNjJksNn4v1KIWtaVLprpS1jVN7Ne9J/30XUYWxaLWsn5powSlcME0vDxNq9orqSC3b5fcQ==
X-Received: by 2002:a05:6808:11c5:b0:34b:75dd:2ee9 with SMTP id p5-20020a05680811c500b0034b75dd2ee9mr14041926oiv.285.1667410122451;
        Wed, 02 Nov 2022 10:28:42 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z8-20020a056870d68800b00136a0143de8sm6275611oap.40.2022.11.02.10.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:28:41 -0700 (PDT)
Received: (nullmailer pid 4192036 invoked by uid 1000);
	Wed, 02 Nov 2022 17:28:43 -0000
Date: Wed, 2 Nov 2022 12:28:43 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 6/9] dt-bindings: media: IR: Add F1C100s IR compatible
 string
Message-ID: <166741012311.4191982.16371047732951396758.robh@kernel.org>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
 <20221101141658.3631342-7-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101141658.3631342-7-andre.przywara@arm.com>


On Tue, 01 Nov 2022 14:16:55 +0000, Andre Przywara wrote:
> The CIR controller in the Allwinner F1C100s series of SoCs is compatible
> to the ones used in other Allwinner SoCs.
> 
> Add the respective compatible name to the existing IR binding, and pair
> it with the A31 fallback compatible string.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
