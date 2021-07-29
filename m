Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEC672
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Jul 2021 22:40:33 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id y9so9128084iox.2
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Jul 2021 15:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OOVxBMpDeZKCsvDZDpFIKnIYayW56aUyxJ0XJKMxJhU=;
        b=qDhIsCiRE9JA+tngEoBWVrKJLjufN7/SNvmSKRcfp6W1ArH0mOCOOafudOhWHrrtHe
         aGMuP5jyknweE75De8Uxn3zBhAPTXDMk27VRaryqCLCUvTXIEdWMn3vCotDtd58we3BZ
         Xu4INHaegC20DdDziD12Sd7DAj1QDshC2CScpQgIaQI4zjD+4yWOfhcvp7Q70gUzG3Zh
         cJQt7Ay3/nc9vZD4f6aSGILNnhIdMZrZDfOAC9yutUwjmUCDyoRV8b8ISHiZ2xteE4Fm
         h11DuuUG9OnjQmR+vV0iB4jJODJLd2of0r+Nvq2hRXzVIlTBJQ8VPNyh0uisOXa9jm5x
         zPTw==
X-Gm-Message-State: AOAM531zsj1+lfZI3G41ql0hLOZfW56KGLQWPJjq6CbHQuKdgqL8PuYH
	M5IrB9x79egRdUc0g5qQMQ==
X-Google-Smtp-Source: ABdhPJzuX7wUe8c+G+oaFJdjEtuWCGo9Rpw06lFJCsEEBBlVR64f+1d3nL4AHz3CAIEPixoGUAEbTw==
X-Received: by 2002:a05:6602:48c:: with SMTP id y12mr5936213iov.14.1627598432690;
        Thu, 29 Jul 2021 15:40:32 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id ay32sm1294002iob.16.2021.07.29.15.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 15:40:32 -0700 (PDT)
Received: (nullmailer pid 1036449 invoked by uid 1000);
	Thu, 29 Jul 2021 22:40:30 -0000
Date: Thu, 29 Jul 2021 16:40:30 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Guenter Roeck <linux@roeck-us.net>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: sunxi: Add compatible for D1
Message-ID: <YQMuXrzqp5vtRaz/@robh.at.kernel.org>
References: <20210726035143.53132-1-samuel@sholland.org>
 <20210726035143.53132-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726035143.53132-2-samuel@sholland.org>

On Sun, 25 Jul 2021 22:51:42 -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
