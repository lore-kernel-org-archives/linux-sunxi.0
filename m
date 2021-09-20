Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB4E72
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Sep 2021 22:31:19 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id x10-20020a056830408a00b004f26cead745so25703153ott.10
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Sep 2021 15:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LaYTMvroF5ySfI6QJ0ThPVlAx09ZLJgE0Mmrymh+U3Y=;
        b=FZMFfOH+iwwSH8fsK5YcP+oc+03xQX9BxiozY+jRlxVaDdMLwdbxddz12rvDikkSh5
         +kMXBq8r5MU4jSV1Pk1Gh8pr3E9hrPHI+5QtNL+R/8OIhTa4GgjubBEKH71WFyludAci
         DI/y0OsjwISsZQrSLD84weMki2RVkgH7npcwqDAkr6ydKyZsSzRMIo3+c0sWPhw9562u
         /+UYe0kHf8mcrjy0PAHyHwTij1bX/j/X95FxBDrRIU5HmzjzKPk+0jHgU//1lv/S7+up
         E4mxQkRIajNP+H1gVEA/qKg2ndv5Y9N3TnwBbC6lASNbk4U0jSHCneCMJVoqnpJMBTx+
         KrKg==
X-Gm-Message-State: AOAM532try5HXx1uM+eTlmYeWhq/WbJ+szF2FzNaLO4hMR+x75xCrm+W
	GULktrF3gUfgwGW7Zn5IwA==
X-Google-Smtp-Source: ABdhPJw87xZoHf3w+GQGKrDfl+ogomFK7KSQ9zKshQl/wynqsa6OZJSG5bZKC4CcbyqbIC/2Ld8+ug==
X-Received: by 2002:a05:6830:454:: with SMTP id d20mr2923366otc.156.1632177078729;
        Mon, 20 Sep 2021 15:31:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k23sm3846545ood.12.2021.09.20.15.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 15:31:17 -0700 (PDT)
Received: (nullmailer pid 918253 invoked by uid 1000);
	Mon, 20 Sep 2021 22:31:15 -0000
Date: Mon, 20 Sep 2021 17:31:15 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: input: sun4i-lradc-keys: Add R329 and
 D1 compatibles
Message-ID: <YUkLs+2amM5nHEz0@robh.at.kernel.org>
References: <20210908034016.24119-1-samuel@sholland.org>
 <20210908034016.24119-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908034016.24119-2-samuel@sholland.org>

On Tue, 07 Sep 2021 22:40:14 -0500, Samuel Holland wrote:
> The R329 and D1 SoCs each contain an LRADC with a programming interface
> compatible to earlier LRADCs. However, the LRADC now has its own clock
> gate and reset line, instead of being always active.
> 
> To support this, add clock/reset properties to the binding, and require
> them for the variant in the new SoCs.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../input/allwinner,sun4i-a10-lradc-keys.yaml | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
