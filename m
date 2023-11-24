Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1102D781
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbOpGzqU"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-58cecfb4412so1078973eaf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 07:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700838325; x=1701443125; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QX6ag15JQklH/2sh4S6Q9NdSDCc91Z9/cyhjI47Mdzg=;
        b=dbOpGzqUnfY3JetXgJJBLZVPyMLRu7ncp5yZmuw7JhnoL047KBA7rrUt75DhykIVpF
         0WCCdr6cWkfSSUxeGaNBsYK5Xof5baKHQICWtgdXR0wBawcSpw5ls6LZCbeXSgAz9pHw
         fB9qfADivLJbzvrqQEtRBcA2UDI5iSAZcZCiY8gboF/9SkcddBsULrs0ilggXUdeFLQk
         XBZ1uoUylKXb5+FO+vOQtQpxoCkEGXWfIKxkZxONd+rwM/ddRmEga+ELOIk9mgyoSoqw
         ksZIfbR4nWzaWknn350Pd4pXFUxvTs9Wxjct1EcYKBbLOQain0v6o+6T5TBmykc0QFeO
         dQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700838325; x=1701443125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QX6ag15JQklH/2sh4S6Q9NdSDCc91Z9/cyhjI47Mdzg=;
        b=dK1BNeVqkl8zDXKkxxsCMTAbl8PpTJlTVyHhjRA3UavOJNkgbMnASV82tkfwdR3E8T
         7TGsT0PDuWFAIGYYjLfwYNXy2z3Ug8pU/hdEWd9PO9m2ChHpgZXf6KQ3v/bcejLN8xrf
         vkr32MatHoqbKVxefR8e1d+E2H6p/G5ZPosg9b/+1kPBRHucsflRmRilWMzj363+HAby
         OMm+vEOXHp7R2Em7ZeT8ZSuND09NqmdSK91swFlNyVuxMxUjOg7PJWl0Vz+bk0wuk0zn
         UFYtshB2R/9mEhAwj1EqdGWjqMChrgRSU1kckULXOsYLg7BamjYLVWm4tEF9GyfEmQ3i
         QUSw==
X-Gm-Message-State: AOJu0YzxUqi0U+cMk0QcKwO+y5vh4Omd7aLHSQwV8UMcZhIG3Sn0Y7Lz
	883ni5kfRAGrcTzvB8crKbOLKVPncAP+cPSBztA=
X-Google-Smtp-Source: AGHT+IHJEgTwvm9Mua8eX8HDXk8ny6QHMvkEalIYb/Rn3JabIxQSoGXmU5w6/caCi7qrgTmwdezSoogBDPpKHPRPA+s=
X-Received: by 2002:a05:6358:6f87:b0:16d:e5ab:66e with SMTP id
 s7-20020a0563586f8700b0016de5ab066emr2942380rwn.13.1700838324568; Fri, 24 Nov
 2023 07:05:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-6-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-6-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 15:04:58 +0000
Message-ID: <CA+V-a8uhTXrLkndHi8N3AQjHuQLG210o5zyOoekHNLbW+NgTdw@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] riscv: dts: renesas: r9a07g043f: Update
 compatible string to use Andes INTC
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com, 
	geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de, 
	irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com, 
	mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org, 
	robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com, 
	tglx@linutronix.de, tim609@andestech.com, uwu@icenowy.me, wens@csie.org, 
	will@kernel.org, ycliang@andestech.com, inochiama@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 12:18=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> The Andes hart-level interrupt controller (Andes INTC) allows AX45MP
> cores to handle custom local interrupts, such as the performance
> counter overflow interrupt.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - Fixed possible compatibles for Andes INTC
> Changes v3 -> v4:
>   - No change
> ---
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boo=
t/dts/renesas/r9a07g043f.dtsi
> index eb301d8eb2b0..78072e80793d 100644
> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -38,7 +38,7 @@ cpu0: cpu@0 {
>
>                         cpu0_intc: interrupt-controller {
>                                 #interrupt-cells =3D <1>;
> -                               compatible =3D "riscv,cpu-intc";
> +                               compatible =3D "andestech,cpu-intc", "ris=
cv,cpu-intc";
>                                 interrupt-controller;
>                         };
>                 };
> --
> 2.34.1
>
>
