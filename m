Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB171EA01
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Nov 2022 17:14:07 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id n83so19839436oif.11
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Nov 2022 10:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTIZIOjl8oF+5s5jwaijQ6Kthz0JlQiH4L1lxXq0VtA=;
        b=NBGfg8aSX5QGl84EWG+zgLQ/aNqUI4gtcl69kMD97Q5sgZYrcRSI0AbjKiB2wEIXy4
         AD9KnSF4gkjCm1hyPJkdzrsz3V4xix8ZutNognWE4SHuO2RtszHYsa9nUzbBInSmpNa1
         DMRyuTNw2JVCD38cJ4O06esyNKTYIZd0qDickgIh9dUNqLHoyvdliI+CwelPdxR2x1i2
         GOJpJVkPtStI+PUuSXdqyQKEZdE/LcJhVcTCvYiiD0ExQvXFuPi2mUp+U/ISqE0zN7X+
         RO589e2VK1LPcV/8WIqfEZzaz5pdDzdhjO2uMgSb4xoX6aNbvFMmclLm26L0Y8u9koXB
         ClgA==
X-Gm-Message-State: ACrzQf0PqMMznYyrhrozVb24MXF5wNSAAfhheiRFjVs581KqPkcikNmz
	0DlroAhRQ5OY/Qwlc0Ogkg==
X-Google-Smtp-Source: AMsMyM48p193/o2iDWjqe7mgVtGRjDXeBC3cmuZcEgnEuSbO7vYriIpF7gBPOO01bKgUQlv33gHJww==
X-Received: by 2002:aca:6007:0:b0:35a:1bda:d213 with SMTP id u7-20020aca6007000000b0035a1bdad213mr7581750oib.181.1667409247069;
        Wed, 02 Nov 2022 10:14:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l25-20020a4acf19000000b0044b125e5dabsm4655265oos.35.2022.11.02.10.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:14:06 -0700 (PDT)
Received: (nullmailer pid 4138810 invoked by uid 1000);
	Wed, 02 Nov 2022 17:14:08 -0000
Date: Wed, 2 Nov 2022 12:14:08 -0500
From: Rob Herring <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, hverkuil-cisco@xs4all.nl, wens@csie.org, mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: media: Add Allwinner H6
 Deinterlace binding
Message-ID: <166740924781.4138628.17832140187371545203.robh@kernel.org>
References: <20221101123201.3021129-1-jernej.skrabec@gmail.com>
 <20221101123201.3021129-2-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101123201.3021129-2-jernej.skrabec@gmail.com>


On Tue, 01 Nov 2022 13:31:59 +0100, Jernej Skrabec wrote:
> Allwinner H6 Deinterlace core is used for deinterlacing interlaced video
> content.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../allwinner,sun50i-h6-deinterlace.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun50i-h6-deinterlace.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
