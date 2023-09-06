Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C364962B
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Sep 2023 00:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96924C433C8
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Sep 2023 00:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693961467;
	bh=LOkOYWgDpfMaKM7j4I5vUi6HfzRf1uXiYn5Gp+JhJpQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L9WwUkhZH0udrang5lEoCi0RceXC8fGySw+ca+m9zeW98RbDllgO7iupNjB2o0B5B
	 aGiwGYr19AKbj/4TGCg9+HFGYnibln30VNAPU211UHAMwH0SOW+DkP7xTcVgWyOBpw
	 G585HAPi49WnN5OpHHFwEPxhSKclHdWMyuCmPG3WTxUrE4ZtnqbXsctIjWK/zuZwjv
	 M8M2eS7fOal4CftuhgWiR0hT9J/jWXPxnuhoQ9ltVNxaaZJJAtN7wF9OdzLaPBog23
	 5afycDar+wrubbKbG8Lk1GJCCvgVpoR0rGTYP/7RpCLST5W5uoudZPucw5CTPkP1+B
	 FyvZf4Tp1iH7Q==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-52c9be5e6f0so4084876a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Sep 2023 17:51:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YxXEINAVLLY+LSS7kxBUtgkwsdY21riPoGiuCn0OhYOyctkCF0k
	y29iL3gCK6Fbi+2BiRDVEO3Y43lsCMVEMreyJTI=
X-Google-Smtp-Source: AGHT+IElTkbYyZUPYQR5VBzmrBOK5ldKYAEDs8YsLwAGbLGs88zIULj6n77vYmOOI8MWwsoyk9I/bmDTQ6RDTZ1WQsI=
X-Received: by 2002:aa7:d843:0:b0:51e:ed6:df38 with SMTP id
 f3-20020aa7d843000000b0051e0ed6df38mr950573eds.13.1693961465837; Tue, 05 Sep
 2023 17:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 6 Sep 2023 08:50:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRTwk6P+PnJcyQKVKADOAjHGmFxkS=axqg58hWvyu=wwA@mail.gmail.com>
Message-ID: <CAJF2gTRTwk6P+PnJcyQKVKADOAjHGmFxkS=axqg58hWvyu=wwA@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: dts: allwinner: d1: Add PMU event node
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Stuebner <heiko@sntech.de>, Wei Fu <wefu@redhat.com>, Pei Chen <cp0613@linux.alibaba.com>, 
	Wenhan Chen <chenwenhan.cwh@alibaba-inc.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 12:29=E2=80=AFPM Inochi Amaoto <inochiama@outlook.c=
om> wrote:
>
> D1 has several pmu events supported by opensbi.
> These events can be used by perf for profiling.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf
> Link: https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/=
gen_rtl/pmu/rtl/aq_hpcp_top.v#L657
> ---
> changed from v3:
> 1. remove wrong event mapping of 0x0000a
> 2. add reference url of c906 events implementation (D1 only support event=
s
> described in R1S0 user manual, but event mapping is the same)
>
> changed from v2:
> 1. move pmu node from /soc to / to avoid warnings when checking.
>
> The meaning of T-HEAD events can be found in this pending patch:
> https://lore.kernel.org/linux-perf-users/IA1PR20MB4953DD82D0116EC291C2177=
7BBE2A@IA1PR20MB4953.namprd20.prod.outlook.com
>
> The patch above also provides a example that shows how to setup
> environment and use perf with T-HEAD events.
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/b=
oot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..53a984d78e3f 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -73,4 +73,43 @@ plic: interrupt-controller@10000000 {
>                         #interrupt-cells =3D <2>;
>                 };
>         };
> +
> +       pmu {
> +               compatible =3D "riscv,pmu";
> +               riscv,event-to-mhpmcounters =3D
> +                       <0x00003 0x00003 0x00000008>,
> +                       <0x00004 0x00004 0x00000010>,
> +                       <0x00005 0x00005 0x00000200>,
> +                       <0x00006 0x00006 0x00000100>,
> +                       <0x10000 0x10000 0x00004000>,
> +                       <0x10001 0x10001 0x00008000>,
> +                       <0x10002 0x10002 0x00010000>,
> +                       <0x10003 0x10003 0x00020000>,
> +                       <0x10019 0x10019 0x00000040>,
> +                       <0x10021 0x10021 0x00000020>;
> +               riscv,event-to-mhpmevent =3D
> +                       <0x00003 0x00000000 0x00000001>,
> +                       <0x00004 0x00000000 0x00000002>,
> +                       <0x00005 0x00000000 0x00000007>,
> +                       <0x00006 0x00000000 0x00000006>,
> +                       <0x10000 0x00000000 0x0000000c>,
> +                       <0x10001 0x00000000 0x0000000d>,
> +                       <0x10002 0x00000000 0x0000000e>,
> +                       <0x10003 0x00000000 0x0000000f>,
> +                       <0x10019 0x00000000 0x00000004>,
> +                       <0x10021 0x00000000 0x00000003>;
> +               riscv,raw-event-to-mhpmcounters =3D
> +                       <0x00000000 0x00000001 0xffffffff 0xffffffff 0x00=
000008>,
> +                       <0x00000000 0x00000002 0xffffffff 0xffffffff 0x00=
000010>,
> +                       <0x00000000 0x00000003 0xffffffff 0xffffffff 0x00=
000020>,
> +                       <0x00000000 0x00000004 0xffffffff 0xffffffff 0x00=
000040>,
> +                       <0x00000000 0x00000005 0xffffffff 0xffffffff 0x00=
000080>,
> +                       <0x00000000 0x00000006 0xffffffff 0xffffffff 0x00=
000100>,
> +                       <0x00000000 0x00000007 0xffffffff 0xffffffff 0x00=
000200>,
> +                       <0x00000000 0x0000000b 0xffffffff 0xffffffff 0x00=
002000>,
> +                       <0x00000000 0x0000000c 0xffffffff 0xffffffff 0x00=
004000>,
> +                       <0x00000000 0x0000000d 0xffffffff 0xffffffff 0x00=
008000>,
> +                       <0x00000000 0x0000000e 0xffffffff 0xffffffff 0x00=
010000>,
> +                       <0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00=
020000>;
> +       };
>  };
> --
> 2.42.0
>
Reviewed-by: Guo Ren <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
