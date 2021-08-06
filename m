Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8B72
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Aug 2021 21:42:49 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id x10so3351282iop.13
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Aug 2021 14:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qd944/33EGNvarYt9LguiByGSn6PliDxz6H/Wc7YWo8=;
        b=s5tsOiNbqO1jee5Tnud1kGIiH6yOb39QyFKF3R81aRkk6GannUE6ctv3XZg6yQ+KY8
         Q9sZHZOaUbZ5SbcDr5I3IEsAup8ZQZbraZax80uJueBSk/r7USdyDLOuu7Fpmti5MhMs
         IhBsUwaQ1zIGyfVPqEqcyZKrRNSDP6Ks3n916LFO3BNURu/LRdpklpmX5/fLF9AMzFrv
         jPec39aYGcJrwrvOsd2CtmPGAYXALW+hkMk5ZnI/EqsKro6HwS/feZ55bH/FF6i/kuRv
         OU5oeZ6EGjtasLfd+MN9qMgRsoXxbGCBcJ4LwM7auwI195DTeETVUOmxK7HhtDYknZpZ
         LC9A==
X-Gm-Message-State: AOAM531ZnG6ks4iA3hbJM0eh99kmlWoilBAGgW8NH7Ept4tFXUshL31u
	ZTQmNplyyrDm3IdrpL+N+g==
X-Google-Smtp-Source: ABdhPJz+ZOeoBtNGfcez4vKR0YkxjL0B2Oc4THdp++CjixnxsCCq3YPDlYVhyfTSfhujhXR42ytigA==
X-Received: by 2002:a05:6638:208:: with SMTP id e8mr11670283jaq.66.1628286168793;
        Fri, 06 Aug 2021 14:42:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d16sm1087635ilc.39.2021.08.06.14.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:42:48 -0700 (PDT)
Received: (nullmailer pid 1854740 invoked by uid 1000);
	Fri, 06 Aug 2021 21:42:46 -0000
Date: Fri, 6 Aug 2021 15:42:46 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 12/17] dt-bindings: mmc: sunxi-mmc: add R329 MMC
 compatible string
Message-ID: <YQ2s1gUHJJjaizsC@robh.at.kernel.org>
References: <20210802062212.73220-1-icenowy@sipeed.com>
 <20210802062212.73220-13-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802062212.73220-13-icenowy@sipeed.com>

On Mon, 02 Aug 2021 14:22:07 +0800, Icenowy Zheng wrote:
> R329 SoC has two MMC controllers similar to ones in the previous
> Allwinner SoCs. However, as R329 has no eMMC controller, the two MMC
> controllers look like a mixture of previous SoCs' ordinary MMC
> controller and eMMC controller.
> 
> Add a compatible string for R329 MMC controllers.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
