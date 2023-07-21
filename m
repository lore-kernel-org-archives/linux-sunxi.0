Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F13F27F2C
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 15:28:04 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99342a599e9so325657266b.3
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 08:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689953282; x=1690558082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjQynSAUQFJ+iQVSHZn81KBk8KudT4uWcOPMPn9BnAo=;
        b=Fru/HYg81exUfFNYakRh1p7PJqFAlQB17OVPbOLY75bWWrLI1vEFTuHYOvbzrjjkrb
         xz8A8cDdJn5YcSRAurcFhKyInWFPKGVOXqJoPZ+GNgIHcFoJdfBqO7XXi02ulklmM9DT
         +KnmT7UygzrNwgatqZD4bYzVD/SoyQuY6OKFxMnGcTce5WvOdrM8plYNWcuVeqgVxDKp
         dhRmIysVaN8JurvJ7+yoCGdXokjLi0PSe+wE3geekL4oecKxS1N+2GwuEYzsJWdDbtoo
         58YpJ051a6UttjIZUjMLzL5+/mqFnQSP1yQTrMYnrekrZltGIMTPy2LWhyCer1boQe/r
         GgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689953282; x=1690558082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjQynSAUQFJ+iQVSHZn81KBk8KudT4uWcOPMPn9BnAo=;
        b=lh6jWQj2jq4XgSFOm8tHU8cLuT4kK+n+2mpghi5AzHI9ByQ+jfIV0gBse4ZJGZCOFH
         ffuxN6F5T+IbQL32p1PF/ee43C+7/r/mZ7Vp43TY8V6+Y9tzI32GSeGkHZgl2ekRWykR
         iCj7HSh8fDAKtmNrC9ZDjNWCt2lGOg11bUigqp2VSURw2LQzLP/+jyoaPydmJkiLQsnB
         EGi4tVHTR3YzselKqUjWg7WPBm5tzM9zS6UgOAtUIVBGUua9T3RhzyU7fC3XdpFnhBEn
         ciAfrTFUDTVAy9vV9U1ns+gaEgdaNob7d5iEDqEQoQLUMdbmxNqrrASelboqaG+cYlzP
         TEqg==
X-Gm-Message-State: ABy/qLYFCVgo4vz7o3mVU5Eo1Ai1ugr3NcglmYUMk6PEzR35GDeXprGr
	dT27gkM1ABMJE80HqVKy7JQ=
X-Google-Smtp-Source: APBJJlG/gk9DPFCa7ss1awkGl2ngITXAEo8YbTZjnoU+2iuYN1nKrXwoKPRdvI6Ex2zlweVIU+pU0Q==
X-Received: by 2002:a17:906:8478:b0:994:1fee:3066 with SMTP id hx24-20020a170906847800b009941fee3066mr2068645ejc.15.1689953282448;
        Fri, 21 Jul 2023 08:28:02 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d12-20020a17090648cc00b00992b7ff3993sm2289595ejt.126.2023.07.21.08.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:28:02 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <frank.li@vivo.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/7] bus: sunxi-rsb: Convert to devm_platform_ioremap_resource()
Date: Fri, 21 Jul 2023 17:28:00 +0200
Message-ID: <168995326156.3656340.11878246818706234631.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706072042.31296-1-frank.li@vivo.com>
References: <20230706072042.31296-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 06 Jul 2023 15:20:36 +0800, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> 

Applied, thanks!

[5/7] bus: tegra-gmi: Convert to devm_platform_ioremap_resource()
      commit: df823d210395341c58e8d346dfc37d6e67e9f2c6

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
