Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C95B4A8F
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 16:08:20 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id k2so19314596oia.2
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar 2022 08:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fIYdhkRgnd5IrdDqw6cSIJSdZy8FeYm4lCYJZq5beHQ=;
        b=cFx4uNfIdN4YSHy5wYPI7WL0vatr70uhmtGH9nV8cSsZgvSZtbXG+OunX9ck3+7K5p
         Xh7dmVca02gvmmncsBMTvu4K2S+gEaO6lciU5lo7nwysKopHEBtZKiNMWMQv+FLAAVA9
         X+IWddokUh7+9vn3l05upR5tUrHeJEqtMAG1bMAd+Cmbv9CWOGxcR0IsxJGYRws0D+iX
         6vJf5Dd8IxWhpvYG3mgSJ30zRoD0EBHSSQqQHYbNLK6A0teyUTqMYN06rwrbsSt/sfK2
         5DTI0Bi/BpOsKk3MuzwtAOX+PKRBu+9EPe4/06FMyz+qyXPyOF4BabAIRQKFvhUAEOyT
         Qbbw==
X-Gm-Message-State: AOAM531srWjuv+03crhjmnq0n/ALOwbS7OzvE3KkOFAxBVA2UvVznvYn
	8UhTXwfUrH3AwbUj0AOKVA==
X-Google-Smtp-Source: ABdhPJyIzxkFrakrSZDtNlGtYK1sQFfMMuwRA141r44tBdCLEzkLpuro9a8jdegDXPKy1BT7Ta7sDg==
X-Received: by 2002:a05:6808:148c:b0:2d9:a01a:4ba5 with SMTP id e12-20020a056808148c00b002d9a01a4ba5mr3090427oiw.204.1646755699624;
        Tue, 08 Mar 2022 08:08:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g18-20020a9d6c52000000b005af7c7cb702sm7555976otq.34.2022.03.08.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:08:18 -0800 (PST)
Received: (nullmailer pid 847079 invoked by uid 1000);
	Tue, 08 Mar 2022 16:08:17 -0000
Date: Tue, 8 Mar 2022 10:08:17 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>, Guenter Roeck <linux@roeck-us.net>, Maxime Ripard <mripard@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, George Hilliard <thirtythreeforty@gmail.com>, linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mesih Kilinc <mesihkilinc@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 01/14] dt-bindings: watchdog: sunxi: fix F1C100s
 compatible
Message-ID: <Yid/cY2eWlHKp7YN@robh.at.kernel.org>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307143421.1106209-2-andre.przywara@arm.com>

On Mon, 07 Mar 2022 14:34:08 +0000, Andre Przywara wrote:
> The F1C100 series actually features a newer generation watchdog IP, so
> the compatible string was wrong.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
