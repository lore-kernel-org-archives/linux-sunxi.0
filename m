Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA69C8E3
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 15:31:01 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-970056276acso418205266b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686411060; x=1689003060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxPCqAAcwCfGdUZiMxaBjYAZU0A3wquYmcYNKNjhuUY=;
        b=VW/oFge+/+Orjlr3UpOgqadtUtBJ58tLJh7c0ptmvXHTALLI1Zz51N8TQSh9+aWdzL
         7VvgNo2iitsbJxxSrRsWx2ElXrUNQuqwp58AqaSWSR4MSb2p9jFQXMx61pVnLw9CzoxG
         +r0AdHepDGV1z/buMuMRwTLzgjk7Czyiwrfdwe7PF5abkrNROckIPIIXpr7LBt7cY1sp
         EGzLGx82Tf4t+lCcuIQJGM9ENkfSvd62acQeVjSUx6IeJnINgNEDTEQ/AnZoyEfE7ybl
         KA2+DI0SydJ5SmngpTSk2UYMStrAzFTfDFZ5jYHKRZcjhkat9scfDh6JIkCrSwnTMZ4g
         7YcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686411060; x=1689003060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxPCqAAcwCfGdUZiMxaBjYAZU0A3wquYmcYNKNjhuUY=;
        b=Fa6zNNKA36m/GFRBbxm3V56i+U3kQtn6cS6ibTP0hnSgwAJBJq5xe8KXpoOFVkL4EJ
         38Cn9VXBPh5N4aBszwIEMF0nmBFLcVbq+qdHUaXyWc4GfcBVR8YCJC+HRKtGrqFCl96o
         7uzOC6ALmfts7GiroDWcjVDeq5BYwjGCTobswO2BzFfjqnABxuyc8uwvGUr2hRy6yzRr
         ecgNgQLazQLfU/7tDrixYTxifxydbZY/jJV61MG1YwaNDju7A2eW6omRtu0lX+X1hRig
         0GQB4lJlh7iO3fvQK+UL4oAQ4QGUOJpBqG3UVhERhjIoyjqIhXiqvrHNYfczmVnT1zOV
         ThBA==
X-Gm-Message-State: AC+VfDzpl3OK1zM1+mznF+YHLqSxp5vkIKkpRWAEybWOXx5Gc6zMXXt/
	ByxJw5+QN0EqjWhKgObs2fTEUXlPL5dA5C0zxa8=
X-Google-Smtp-Source: ACHHUZ5ze2gv8QfGmKLPkmbnKeZqHcnYPyn27zxIIkW9XeukUemNkvD0q1gl/Wy1GyoPAlHRwGYvRgduuF0eBtVKhis=
X-Received: by 2002:a17:907:c15:b0:97b:4c8f:c44f with SMTP id
 ga21-20020a1709070c1500b0097b4c8fc44fmr3530103ejc.46.1686411059681; Sat, 10
 Jun 2023 08:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230610141739.999268-1-bigunclemax@gmail.com>
 <20230610141739.999268-4-bigunclemax@gmail.com> <20230610-rehire-amid-2517f43504c0@spud>
In-Reply-To: <20230610-rehire-amid-2517f43504c0@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 10 Jun 2023 18:30:48 +0300
Message-ID: <CALHCpMiEmc8L=O86_x7-KkBHFwf2QpuP0M7ugz7dNPr71cpJmQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: thermal: sun8i: Add binding for
 D1/T113s THS controller
To: Conor Dooley <conor@kernel.org>
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

=D1=81=D0=B1, 10 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 17:52, Con=
or Dooley <conor@kernel.org>:

...

>
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
>
>> Why do you have 2 sign-offs that are both you w/ different spellings?

Sorry for that. I accidentally signed it twice.

...

> +  - |
> +    thermal-sensor@2009400 {
> +          compatible =3D "allwinner,sun20i-d1-ths";
> +          reg =3D <0x02009400 0x400>;
> +          interrupts =3D <0 90 0>;
> +          clocks =3D <&ccu 0>;
> +          clock-names =3D "bus";
> +          resets =3D <&ccu 2>;
> +          nvmem-cells =3D <&ths_calibration>;
> +          nvmem-cell-names =3D "calibration";
> +          #thermal-sensor-cells =3D <0>;
>
>> Is this calibration required, or optional, for the d1?

Calibration data for the D1 is optional as for the H6.
(But without it, the sensor data will be inaccurate).
