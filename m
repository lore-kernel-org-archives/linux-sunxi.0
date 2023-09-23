Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0445664
	for <linux-sunxi@lists.linux.dev>; Sat, 23 Sep 2023 07:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94887C433CA
	for <linux-sunxi@lists.linux.dev>; Sat, 23 Sep 2023 07:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695455451;
	bh=ubMZKfnyWKEVj8IonDZ1KMHOScdcFtBBm3nDE8Z1AWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QiIERg4N7rrYpj3SdR416sb92nDUGV9zxcTCRd3QekW4b15Ph48zl1w0nIrDDR7NP
	 toaj5B4xUccHC8mDBCvMRdT+LcYwdqtL421Kh3j3YLMR2S2//D4Jm7x3mwKLE/jxqo
	 WfwGAG76J65srxjJ4nuVPpfeiAzftq9pUUamLUQ5uRhXyhTxz/s7qeQfgNpZJMyAsb
	 n7R3QhjAnr1FOlX1hiZ6k8eBQILTi1xNPpAFg5w0fF91/GHCNE/AD8SL6v+SCfRr7g
	 5J71CiSYG3bWNuSt2A+4nF2YIbHfeW8BBkteF8jJZFDrGHLxqsWP65I/j3tDp0Gm34
	 KrQV7vUY/hp5Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50308217223so5322403e87.3
        for <linux-sunxi@lists.linux.dev>; Sat, 23 Sep 2023 00:50:51 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw4CXPao1wPFVxff67auJb9hBBTD85UcNTJo2Rf3Az0ILrFzCe3
	D44xxggT72kLSkpceftQ03//sVx4VJp1tWehew8=
X-Google-Smtp-Source: AGHT+IFea1wRy5eJudPxUVu3RtK9dVhqNh4TIRC1jtYqezMS8B5X7TK38IQtLbtJiEI0LfX+mY8MEQQsI3NSizqlOp8=
X-Received: by 2002:ac2:4a69:0:b0:502:d302:e025 with SMTP id
 q9-20020ac24a69000000b00502d302e025mr1061315lfp.2.1695455449792; Sat, 23 Sep
 2023 00:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922081351.30239-2-conor@kernel.org> <20230922081351.30239-8-conor@kernel.org>
In-Reply-To: <20230922081351.30239-8-conor@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 23 Sep 2023 15:50:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com>
Message-ID: <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com>
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new properties
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 4:16=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Convert the th1520 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/=
thead/th1520.dtsi
> index ce708183b6f6..723f65487246 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -20,6 +20,9 @@ c910_0: cpu@0 {
>                         compatible =3D "thead,c910", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> +                       riscv,isa-base =3D "rv64i";
Why not riscv,isa-base =3D "rv64"? I saw "i" in the riscv,isa-extensions.

Maybe this question should be in this mailing thread and a little late:
https://lore.kernel.org/linux-riscv/20230713-tablet-jimmy-987fea0eb2e1@wend=
y/

> +                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> +                                              "zifencei", "zihpm";
>                         reg =3D <0>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
> @@ -41,6 +44,9 @@ c910_1: cpu@1 {
>                         compatible =3D "thead,c910", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> +                       riscv,isa-base =3D "rv64i";
> +                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> +                                              "zifencei", "zihpm";
>                         reg =3D <1>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
> @@ -62,6 +68,9 @@ c910_2: cpu@2 {
>                         compatible =3D "thead,c910", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> +                       riscv,isa-base =3D "rv64i";
> +                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> +                                              "zifencei", "zihpm";
>                         reg =3D <2>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
> @@ -83,6 +92,9 @@ c910_3: cpu@3 {
>                         compatible =3D "thead,c910", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> +                       riscv,isa-base =3D "rv64i";
> +                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> +                                              "zifencei", "zihpm";
>                         reg =3D <3>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
> --
> 2.41.0
>


--
Best Regards
 Guo Ren
