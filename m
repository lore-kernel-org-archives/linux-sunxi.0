Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6973FC2
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 12:06:25 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id s3so16890089ljp.11
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 05:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=67mrbeynTpURtFY8gyP0ws8OzeKxI+eTxfHxy4dGBl4=;
        b=mx+X6gYODqrZfvoxgxIxEH8CITtHcNuAEKskS3mbxFeXBPiOE5wGoHbc+PI4REihv1
         XUGsfsJq3DFw0RnljmWeLZYkMuagjZd7p1/2VJWeVOmuSdE0I2F4TWzKHSTx4KnbfPrn
         nhV7Jicu4TyM9y6kfrE1zIbO6wG1Jrw8HbuN2NG+Bc2Szxr9kk0CihGRyKcFwltHJbHl
         mmRZv1SyPdJi9MtVl8EmzEjR5KvnrCB4i44GhfExzabvSQZiaa0HSBoBCGqc7F5JhjUo
         yX7Vi3rlcvbCwTgNfpRQKQiSOoosPoynXFcXK2xh8JPgXXFhIDPobe6Gd58qEYTyDWc4
         JenQ==
X-Gm-Message-State: AOAM532M1SVdA8NRDYNknpeZ7i2LF4QEYbxlN+RK10+vYFdqElm2mvYE
	aVZKqbnO+8mF4kcoA5o1bObF5NSBRBI1EQ==
X-Google-Smtp-Source: ABdhPJx8A9CaKAkLOJzF6SCqJNqAf5qJAaJf5+UXtS0gMIQOWlovFGX6iStBEs/8JSZQSrQd5M2Cog==
X-Received: by 2002:a2e:9d0a:: with SMTP id t10mr15773006lji.282.1629461183202;
        Fri, 20 Aug 2021 05:06:23 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id o6sm615522lfu.98.2021.08.20.05.06.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 05:06:23 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id j12so2517875ljg.10
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 05:06:22 -0700 (PDT)
X-Received: by 2002:a2e:b708:: with SMTP id j8mr15452490ljo.488.1629461182570;
 Fri, 20 Aug 2021 05:06:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210820081645.83796-1-krzysztof.kozlowski@canonical.com> <20210820081710.83908-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210820081710.83908-1-krzysztof.kozlowski@canonical.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 20 Aug 2021 20:06:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Mx76p0G4nsfAtdLOuzj462Ok1BkqRTgT1BD1ndDqVwA@mail.gmail.com>
Message-ID: <CAGb2v66Mx76p0G4nsfAtdLOuzj462Ok1BkqRTgT1BD1ndDqVwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: align thermal zone node names
 with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 20, 2021 at 4:17 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Align the name of thermal zone node to dtschema to fix warnings like:
>
>   arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dt.yaml:
>     thermal-zones: 'cpu-thermal-zone', 'ddr-thermal-zone', 'gpu-thermal-zone' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
