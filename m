Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661003;
	b=0iOvmRfY6snyT2JfcVf4c++cfvXi3uDoErcu02XrujcgtsW6utyKCu6uQcvMeypqIXEp
	 iw8OstMU/uJsaRTLQ7cJMVOBc6ZjDjxEaYMUJue75uvo+9/RDO+pEDw8gKc3RC+Z67mcx
	 zR6+JtlQWGfea1t+U0VPnp1Ac3mC1iiUYO6WVWWbsD3bP/Pta5KQUn72LHx5IsV92IKAP
	 nbf5bQmyEniUtr2Z1scgPb+aE8GIcarCTxGxp4MrfC9VLUK9NN9DtxRfZlDYwLxQLNirg
	 9+Low1anjDxl0lgajdx3+HWyJ025WvhynxHoP0Q7XPaE3P9rJlP2YNKaf7M3vjo9Tlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661003;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CzDnQhxA2IGwG1S+MSyz5T4mghlVNlgfIGD03W+DjPU=;
	b=kmSOQuVW5h/ikm4Om9HyqKfC8YFExnhSXV9FtpZxOTCy7HCuAj4xgqlVLY8ugaAuAM8E
	 s+4jCPijY+6ArVl9b8Fn20htJsoUgOTko+5rhBnIpPaN3+FrhwKT78KF69KnueAkWKiGq
	 UyHp1G0RNoHE9RoaS0z+BuZT4gV5UGrzObqQODU0itK2R048jcOvoL3zpsZbwnN7X928A
	 540AGYDuJPihcZ7HOP9eVekGqwQV0UHY6uec6u8jGxaOkesL0PcRTeCx2QnBU0fvGohRY
	 uxIWSQ96kq7OSUIQJDM+TcHSyQn68y+7oIHthBdAxYDAKlSwx1n6qRe9PCByIfIhn8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCVzNZ7A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043BD606A32D
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCVzNZ7A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25FD1F000CF
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661002;
	bh=CzDnQhxA2IGwG1S+MSyz5T4mghlVNlgfIGD03W+DjPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kCVzNZ7AVIraFnGuWy/V8clT3ISDKxjx0XkadJK2jr7NMB4Pe4ffzu9w2yqIEyj6N
	 1GK33H2n3Fx9q7xwPsQ/GgrLLP4nXioMcXsCV9nPouj0mTOJ7HVeqQQ3gBmZmILxhW
	 UxMsYHJSYt9bNb0jsmCHIkQCb3O/pyh7cGtfQYPipPuEu/2CRXlz0TZdfImEULaMvr
	 hx/tp8kXM4tAJidvx1W9uiOSom0Wi9ztx0iN6JRi2lp02HCh7sjaeH9TbN4iXdHmnl
	 vDzVU7E3Xx+s0rNR98A1as2o1TTILaq2BRJkSouuvCrmsGUfjVVqkAYk77DgSnYict
	 N/YZzSKmkA2ng==
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so501915e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 04:56:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEj6K2vTQvGgXXsM7CnM8YnO33Pgv3hKtPi9kpuZ1dPgKNVF25S5i1D+9ScF9phqFemJZiIdon0CVKM+A==@lists.linux.dev
X-Gm-Message-State: APuU4Z8btxT+PGHSkrXBdkFtCBYFw3VsBZwQGcLWB5ZelDNQsrbpyQzb
	UMbBCKnjEAJy1y7PsXl3Ga34rQJDKcWyUA3E55yBazyY1iyKwXCUt8qh8kd9bK7SFc94F7tG+hQ
	5sa+7I5ZcIam5OyoRh5kr+uLB8BFWH7Y=
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id
 5b1f17b1804b1-4bb55a99ed0mr112169185e9.24.1794661001252; Sat, 14 Nov 2026
 04:56:41 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-2-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-2-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 20:56:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSHBu3qVmqQDfmn4wfy2uGY-bGN3xKxqpO=ULVfoXD3-g@mail.gmail.com>
X-Gm-Features: AclHuK87BF-AIKO2shVxwQUjV8SpcPDdYGTchA_sgB49NmXU0PUHvZ5gp9vekk0
Message-ID: <CAJF2gTSHBu3qVmqQDfmn4wfy2uGY-bGN3xKxqpO=ULVfoXD3-g@mail.gmail.com>
Subject: Re: [PATCH 02/19] dt-bindings: riscv: cpus: add the XuanTie C907
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:33=E2=80=AFAM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>
> From: Han Gao <gaohan@iscas.ac.cn>
>
> Add the XuanTie C907, used in the Allwinner V861.
>
> XuanTie is a brand of C-SKY Microsystems [1], whose JEP106 ID 0x5b7 [2]
> is what the C907 reports in mvendorid, so use the csky prefix rather
> than thead.
>
> [1] https://www.xrvm.com/declaration
> [2] https://www.jedec.org/standards-documents/docs/jep-106ab
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 0da219ae6769..bdb119ab8ee0 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -48,6 +48,7 @@ properties:
>                - amd,mbv64
>                - andestech,ax45mp
>                - canaan,k210
> +              - csky,c907
LGTM!

Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
