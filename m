Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234D772
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Nov 2021 14:25:51 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id p37so6290856uae.8
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Nov 2021 06:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=lgl9BpbsUud0C8euZ8/m/mBaucmePFOdUSvOyanF4Vw=;
        b=npRRx4bQ4ZYWyZyTq17fLDnLE5g5zHqiTizYpg2x4D7j+cDS6oBudnK7yPZR7n4VGE
         sdACIqWMFPxHM5QpQAltr15rKepisfd3mErjr8SZSvDPGAsudByZ7xBuA8WwLifcDEHS
         loP+yPhyjEClMovvRmw5+klZHC/j7obU36YTJX8LMUcLb8YQmMNadU+gVfhVfzBwFpJV
         GDE1HxmiRhQ9jc7dZAfoGX1DRe0HtDXIkdCbz3hOw1yJtxx4GjTlqE9ELUxA2/D8hhU3
         ur9BTsGRXqXYQepSE3ZizDN3pTySBCo6mhfVrsOAWI2NEb5r9dOCPCM+Ufu3dlxVQ4zg
         aqmw==
X-Gm-Message-State: AOAM530KC1o7H5zPs87HfuCUemwkKNNCjbSPHQiYuhiy35fLjPCiYa5p
	cudayYDLm6vZ4fNvQpoMrfOl7NKdVhhAqQ==
X-Google-Smtp-Source: ABdhPJxk/0l4QueTUz3j7fb0/zynQglDfULlCsqemvW4e5FDRfRXuw1C81dmWYmR4tzFGPtNDHwkhw==
X-Received: by 2002:a05:6102:4192:: with SMTP id cd18mr69866496vsb.35.1637159149882;
        Wed, 17 Nov 2021 06:25:49 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id q12sm11979642vkd.1.2021.11.17.06.25.49
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 06:25:49 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id n6so6372245uak.1
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Nov 2021 06:25:49 -0800 (PST)
X-Received: by 2002:a67:fb41:: with SMTP id e1mr51636446vsr.28.1637159148368;
 Wed, 17 Nov 2021 06:25:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211117140222.43692-1-robert.marko@sartura.hr>
In-Reply-To: <20211117140222.43692-1-robert.marko@sartura.hr>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 17 Nov 2021 22:25:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v677JvkwZnp+3ST0UNsOWLnzT2QfmYAq22t7T03AVuOSzQ@mail.gmail.com>
Message-ID: <CAGb2v677JvkwZnp+3ST0UNsOWLnzT2QfmYAq22t7T03AVuOSzQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: allwinner: orangepi-zero-plus: fix PHY mode
To: Robert Marko <robert.marko@sartura.hr>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, Ron Goossens <rgoossens@gmail.com>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 10:02 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Orange Pi Zero Plus uses a Realtek RTL8211E RGMII Gigabit PHY, but its
> currently set to plain RGMII mode meaning that it doesn't introduce
> delays.
>
> With this setup, TX packets are completely lost and changing the mode to
> RGMII-ID so the PHY will add delays internally fixes the issue.
>
> Fixes: a7affb13b271 ("arm64: allwinner: H5: Add Xunlong Orange Pi Zero Plus")
>
> Tested-by: Ron Goossens <rgoossens@gmail.com>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Tested-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
