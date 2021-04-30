Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A382F80
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Apr 2021 21:46:12 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id h9-20020a4a94090000b02901f9d4f64172so1568403ooi.5
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Apr 2021 14:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lQ8vdEh4rJx00Ki7Tq3K8HSCeSzDZ++EPb2cKQeU+yo=;
        b=ZzXWAPXcn2qzBZ3MIQ/JgcbP6NDyQB3M1oA6XddfoqDWLRiw26Zp5vrFeioG5FkuFd
         u42LS2dUv1AqTClawL1ThrKsSW9l8KRv5Jx8IDQyn/5qZym4EoMBjtmp8WiOYKsJ/jfH
         ttp4gX8JIZqSCgIExgE5CXI2NBrKDqPDrvW3hp2i35l8oxFXBbqCQ4GfmN5ptyrD5TPl
         t6s5CpayYuuAT5Ak50iWP5+OhhWdqSYTVyd+swoSCqkqUSCFMhGRmXM/DDS5sZcn+See
         +39cI6oJSeOni9kJmBjTUem+V5Vx3aPHeLuSZ5+FpHsLtBJ8B35jiJPO3AVDtXy5TIea
         kujQ==
X-Gm-Message-State: AOAM531TmYZuNiR1I4xCt6vPLc/Raob1o5UYzNnPAY71Y/vXRQNf29zJ
	Yg6FHhQjLr/bCBKWelFfyQ==
X-Google-Smtp-Source: ABdhPJz6PdKIigOtZcVYOpEsFx+nvBVRc8Vx+MdzxKvkVayWWFkpXLA1s7S9yhZm38LZWhL24gYbaQ==
X-Received: by 2002:a4a:1104:: with SMTP id 4mr6265762ooc.57.1619819171630;
        Fri, 30 Apr 2021 14:46:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u1sm1055005otj.43.2021.04.30.14.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 14:46:10 -0700 (PDT)
Received: (nullmailer pid 3956163 invoked by uid 1000);
	Fri, 30 Apr 2021 21:46:09 -0000
Date: Fri, 30 Apr 2021 16:46:09 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: sun8i-codec: Increase
 #sound-dai-cells
Message-ID: <20210430214609.GA3955996@robh.at.kernel.org>
References: <20210430035859.3487-1-samuel@sholland.org>
 <20210430035859.3487-2-samuel@sholland.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430035859.3487-2-samuel@sholland.org>

On Thu, 29 Apr 2021 22:58:53 -0500, Samuel Holland wrote:
> Increase sound-dai-cells to 1 to allow using the DAIs in the codec
> corresponding to AIF2 and AIF3.
> 
> The generic ASoC OF code supports a #sound-dai-cells value of 0 or 1
> with no impact to the driver, so this is a backward-compatible change.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../bindings/sound/allwinner,sun8i-a33-codec.yaml         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
