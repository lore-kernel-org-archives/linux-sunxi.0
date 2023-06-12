Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96EDC8D8
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 08:17:33 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51480d3e161so6019029a12.3
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 01:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686557852; x=1689149852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RgjaXpEXsHKymgoZwVAer6HS1GkgWzeejMdXZmBJCA=;
        b=feZKdABYE4vr0/NYmcc9gHJ+PR5oKfdKIGeOnjty5TMRvE8Kf3x/25BlUC/YevRf3A
         jpSTRgRNFWCSTB2nGom8Azd3j5v4iuDtw1kwHFypuv+ZQCQDj4Um3K+Kc/68sjdXlIQ3
         +C8p/IFKrHF1iNClgAlJgppEO2YQXT8Jcemow3vQ4SZ1CRtC4sV1dbvNGTqihj8PVCtO
         djckobs1jZL6CMyhDqol7VJBSTlig2FFj87b2+XaSY9L7nwnZXNvI+/LN0yENHERKebe
         JXYAVYJjDLqFNxUj4dBY05LSW9N/atu3TUJeNY3llYeCmiivAGMF/gdklFewXBdvVUs7
         e2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686557852; x=1689149852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RgjaXpEXsHKymgoZwVAer6HS1GkgWzeejMdXZmBJCA=;
        b=YHtDnh3HywXQ7CBa3YtHwWCX3H+MVu1wUp4MUS0rhDJqDuz6c5zPd0P+Y1MoE2lvgZ
         nJ8W7yjmgN+3tH9kri/tg448EIJ873Vm3A18a3nnpA7fRlV2KcANkOx7ovFEoQfSML9O
         fsm+go/pjBo1fHU5E11C6OHJtIXrefp0SYHg6SDBZnU2AQyPrLmP1h9eo8v+z+87AFNp
         5Btil+QypYeh0lfBb+GZh4CyGCI9MTa6C6iNG1kbtwPSg96myPl3Hq7KidCrJqTqc/Wq
         ZegB1AjCH5rhcsvCF8UGCEub09rreswBIsAF4EWvKQF/sJH4P4wpjz9ridI6liEWKbRl
         S81Q==
X-Gm-Message-State: AC+VfDy853HVoq8QcpWiOpVsqBWheerv9ymotSG9dOv1V5KZkAikYqj+
	71A5WGLmpLoCVjfL4VUxLx+WQ+DJkiuyNZtBjsI=
X-Google-Smtp-Source: ACHHUZ7FCeE2TU5RO0p4ZuTCrHCZsjmIYAyrRLpmWVGZEiXpCqk8v7qvN+gL76ATcUoQUnkiopkcmT1f+cSgMJTc7b4=
X-Received: by 2002:a17:907:9307:b0:974:2169:5f81 with SMTP id
 bu7-20020a170907930700b0097421695f81mr8955047ejc.22.1686557851593; Mon, 12
 Jun 2023 01:17:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612063429.3343061-1-bigunclemax@gmail.com>
 <20230612063429.3343061-4-bigunclemax@gmail.com> <20230612-wriggle-remindful-89d5105c94ee@wendy>
In-Reply-To: <20230612-wriggle-remindful-89d5105c94ee@wendy>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Mon, 12 Jun 2023 11:17:20 +0300
Message-ID: <CALHCpMjxboLn2eTjOJkE2JAzH3S8OB3v9fWqDOdeipAmLvLx2Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: allwinner: d1: Add thermal sensor and
 thermal zone
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Conor

=D0=BF=D0=BD, 12 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 10:55, Con=
or Dooley <conor.dooley@microchip.com>:

...

> The RISC-V patchwork automation is complaining about this patch while
> running dtbs_check:
> arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: thermal-zones: c=
pu-thermal: 'trips' is a required property
>         From schema: Documentation/devicetree/bindings/thermal/thermal-zo=
nes.yaml

I didn't add 'trips' because I'm not sure if they should be the same
for the D1 and the T113s.
Maybe it's better to drop 'thermal-zones' from this patch and add them
later in separate patches
for T113s and D1?
