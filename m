Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C5D258A
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Mar 2022 19:06:52 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id 85so10379635qkm.9
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Mar 2022 12:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lx1eZkma7iJzkfFGXDnVMbMm204ox+IUdPJ3sWGBz5k=;
        b=acLUNmjtYRi3RgB+d6itWyZ/MUxy9AhcNnVX6fIn2WjhEZtwzDXbFxuwSpMEy4LXq9
         DhLk4EUOJW1KXsrW+oOcF4T0XOd/daNbXZkBsmu28x9IdbltV07CCuzACgJEG31kHVtL
         oIZCMDA1umCAdcrujJjqfdGcseHRrZi0lmpuxu2X0vOTMV6e7qecwa3WZfyWCBnQCjH1
         oE2EJ1GzzJhEplXuQJf2QGOfiiifl1azsOMstNutBXWvfDaHSt6Mojlr9kp0vfCWXE+v
         dc8OMaUdwLivfpf2rUsSSV8HVJM3FiqOsPi5Zlqi59RKiee9KHR5o771W8WL1wvzIxMP
         wBog==
X-Gm-Message-State: AOAM530z+Fg0GH+u9F3fW9waBcM4TzcHPoJNLQuGw+HT3rHWF6VwRzKc
	QqZUrRmrcpVOx96ZJwr5Dg==
X-Google-Smtp-Source: ABdhPJzE8K1tfzEVyGgvcJEw/3JVMuvQuaGobkEXXxHttkinxifw7Ro8zMIelZkmYsuVP/hBKBZM8g==
X-Received: by 2002:a05:620a:1251:b0:67d:7739:7ff3 with SMTP id a17-20020a05620a125100b0067d77397ff3mr11034351qkl.199.1647803211441;
        Sun, 20 Mar 2022 12:06:51 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:c6d:21ec:c4f5:bb3:5269:3b0e])
        by smtp.gmail.com with ESMTPSA id o206-20020a37a5d7000000b0067d42fd49c3sm6868251qke.4.2022.03.20.12.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 12:06:49 -0700 (PDT)
Received: (nullmailer pid 3227299 invoked by uid 1000);
	Sun, 20 Mar 2022 19:06:46 -0000
Date: Sun, 20 Mar 2022 15:06:46 -0400
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>, Samuel Holland <samuel@sholland.org>, Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, George Hilliard <thirtythreeforty@gmail.com>, Giulio Benetti <giulio.benetti@benettiengineering.com>, devicetree@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: watchdog: sunxi: fix F1C100s
 compatible
Message-ID: <Yjd7RkwFk4SbZds6@robh.at.kernel.org>
References: <20220317162349.739636-1-andre.przywara@arm.com>
 <20220317162349.739636-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317162349.739636-2-andre.przywara@arm.com>

On Thu, 17 Mar 2022 16:23:38 +0000, Andre Przywara wrote:
> The F1C100 series actually features a newer generation watchdog IP, so
> the compatible string was wrong.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
