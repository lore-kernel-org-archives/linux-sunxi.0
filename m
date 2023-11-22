Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB6B1A58C
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Nov 2023 21:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVnx0uwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52B0C433C9
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Nov 2023 21:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700687684;
	bh=AdLucksemJuNek6Q2mYTXAkYIMbYexxotameJ9QABko=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LVnx0uwqLWCYmAWiJKlx+9QZY8fRd84MrS0vGuvyazCtR5o3mZtlr3SkUdoQFEw5q
	 UtNc1CTaNHgDIqW2h7FzeJEGCtMkG4v/XTFdWhixb7x90ya+qqVqmo2fv1mE5lkGcn
	 yMRdvsfvOr+m9J16TK3uAFuZjXCMPiUGrwPR40Vh/UmeYuBQ78UGAd4eOFn1UxVP0X
	 YDLPQGEBxMnwQc5P38fREVZFDBu0Nacjs2ikRl1U8sikSrAqDWzl/Z5iIdeFjiaxCh
	 cFA7xfNn/SJEjNDQeEAkgPJp6T8pfSIMLHhByTGbgBHIfMa67cgtGE3ZoMds8ltKaQ
	 iU/KdKOJmhqqw==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-54a94e68fb1so931264a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Nov 2023 13:14:44 -0800 (PST)
X-Gm-Message-State: AOJu0YzuJVNnEuEUcii1fwPvBoWN89BwPok7ey9W7SiCIAVFquMlkPdr
	c/DnVtNaNO1KEbYAOqbSYSLIofPY7o/bno98DtA=
X-Google-Smtp-Source: AGHT+IGIAQGj/hNQ0yottVsGW32nM9K4Wad//z6CZkRNPSM4tQ2oBX2Rax3OWYHQw9MprWovLzjIL1OmqUf1i6gr5yE=
X-Received: by 2002:a17:906:b218:b0:a04:98ef:c73c with SMTP id
 p24-20020a170906b21800b00a0498efc73cmr600541ejz.23.1700687683439; Wed, 22 Nov
 2023 13:14:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-10-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-10-peterlin@andestech.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 23 Nov 2023 05:14:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSMe-yfzKfX92eWhBnJ_WwoYQu7_7fsOQuNqXdafHA1dg@mail.gmail.com>
Message-ID: <CAJF2gTSMe-yfzKfX92eWhBnJ_WwoYQu7_7fsOQuNqXdafHA1dg@mail.gmail.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension description
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com, 
	geert+renesas@glider.be, heiko@sntech.de, irogers@google.com, 
	jernej.skrabec@gmail.com, jolsa@kernel.org, jszhang@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, locus84@andestech.com, magnus.damm@gmail.com, 
	mark.rutland@arm.com, mingo@redhat.com, n.shubin@yadro.com, 
	namhyung@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	peterz@infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	rdunlap@infradead.org, robh+dt@kernel.org, samuel@sholland.org, 
	sunilvl@ventanamicro.com, tglx@linutronix.de, tim609@andestech.com, 
	uwu@icenowy.me, wens@csie.org, will@kernel.org, ycliang@andestech.com, 
	inochiama@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 8:17=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Document the ISA string for T-Head performance monitor extension
> which provides counter overflow interrupt mechanism.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v2 -> v3:
>   - New patch
> Changes v3 -> v4:
>   - No change
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index c91ab0e46648..694efaea8fce 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -258,5 +258,11 @@ properties:
>              in commit 2e5236 ("Ztso is now ratified.") of the
>              riscv-isa-manual.
>
> +        - const: xtheadpmu
> +          description:
> +            The T-Head performance monitor extension for counter overflo=
w. For more
> +            details, see the chapter 12 in the Xuantie C906 user manual.
> +            https://github.com/T-head-Semi/openc906/tree/main/doc
> +
>  additionalProperties: true
>  ...
> --
> 2.34.1
>
Reviewed-by: Guo Ren <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
