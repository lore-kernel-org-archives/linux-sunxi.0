Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538807;
	b=rIUZIxQbmtbvaIsVDWuZyxDtKhYkaXpFRPiDbHJoi8V0pBd8Yaywb9Q6qGLcoLlZdt/P
	 fsrwgIF1giW0MUAimiYClRnd2VwjcFN2raKc6iiT9xZeNCC6UQFiTr1TdaUYoyxORixk5
	 oHk+C//OD27oOcg4il3sLZXzCvJpMeK/EQBLmAN4vkJfZ555G4frVpTD+rleiiu9Ec+Rs
	 UOpFEa36KI9DK+o3wAtlMbFk+Pu5c8s0GWoIi9LTWZefx8yGCJzRz+DPrEssP24rKc+Xl
	 noZ31gjVsTBpmUCaaIcNa/RBQ5j42DcH1z78g8aizgN8OV+ctA1+fFrYvAFNMjBdU/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538807;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yjaryd27oxhS3uqOySH/viuHpeO0W7Au9OnQvtXAiiQ=;
	b=TueLwsRB55EbeANOcbpvWij2TttBiPfeJsRpOF/ldE9tXwQCKtAArYaFRyidF9smrfbE
	 HA/Q7MjW8Ai2cPGk/OXrk4F1OIyou6OqxZQpj1bMfEU2PGiNkEmNp67+ttcUelPiKIukt
	 oZ4oM/FOxGpik+0PPehTKdbvRpfL4bQrTC+7+qsQOZJJUAFlDJT0HH2ogVJil5w1fjAnm
	 gTlZg35H7uiPnrNgR4/XeYz90Qtj7rVIAUByHawXGMgTE2e74j0N4APPOi/7rEvQim7p2
	 yeCq31q3jmYK8gCD9BsPGGvpFffUKWCBk/NqjMrW/63MN1Us9LPEJXNKA3NobfxZGrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R20lcf1K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51564606A329
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 16:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R20lcf1K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79451F000D0
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 16:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538806;
	bh=Yjaryd27oxhS3uqOySH/viuHpeO0W7Au9OnQvtXAiiQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=R20lcf1KAHZseBnOOhfMkowzGb7DpQKNtesAmo3s/ojEwXRJC28823762+veBSRmX
	 Hfhy1oOnDosrQVAXL4mCFkuXh+apDNIE3SV7D7/fEkM2THNY0lpbdRWMuKrUVaerNl
	 zTG16zTd/spHpAsPcnNT9mhJmNk/Es7eTllQNapipI6Qd8b1Tx5bExHapb7aUhZwwn
	 AiTdHq4nEjTU6Y2llGcEFWvaLdcrXgEwrf464KlsvjortOnq4Aew94U39gnE0wSkTl
	 Sro4rrpJwmGOd1Z0mEsaJa/dylRwtWYrDuiulHqqPMo73Hu49mMad6R7zB681Sdr9j
	 6+CJ8zxubkfrw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adfed9a887so43190831fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 08:46:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHU1Vm8VkQjezQm2ZNZdpLeR2kWvVnajlNtCqTG39RwJ0vDe2rVGbAM7pD76IBNmQgh6wmFkvtThu0bIQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Ldc6kB8SGD0N8eFWBapaBmT2wirBVggprGRLIDa6LRr2o6hG/
	vuFhvvNKP5sVNn5mPxIQLz6NvV7+GrmJbBtF3ZFyg4dJ8jeKmRSWhZi+VlgCTie3bcry1HE6PRS
	NHzpW9Zja/R4OhIYsyCqBQXgAcxbWGEo=
X-Received: by 2002:a05:651c:54f:b0:3ab:4a7c:7a65 with SMTP id
 38308e7fff4ca-3ae7f7cd8d2mr40665631fa.0.1795538805127; Tue, 24 Nov 2026
 08:46:45 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 25 Nov 2026 00:46:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v640hK3TYkg=h1Uyu4g497+tNTLB10ytanT2cg8KTo1CJQ@mail.gmail.com>
X-Gm-Features: Aa3M54ofXX9uKf5nGvU7EWiKfn4kNgd22MIxm2y-Mzkn1AEQVUvT2v_OH_Oaj1Q
Message-ID: <CAGb2v640hK3TYkg=h1Uyu4g497+tNTLB10ytanT2cg8KTo1CJQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, 
	Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, 
	Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 1:42=E2=80=AFAM Enzo Adriano
<enzo.adriano.code@gmail.com> wrote:
>
> Provide the SoC description needed by the initial Cubie A7S DTS for its
> console, PMIC, EEPROM and microSD. Describe the CPUs, PSCI, architectural
> timers, GIC, RTC, main and always-on clock/reset and pin controllers.
> Include the main and R-domain UART/I2C instances and MMC0-2 with their
> pin groups. Use mux 6 for I2C0 on PG8/PG9, as in Radxa's BSP pinctrl
> driver and its Cubie A7S device tree.
>
> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
> and noncoherent attributes follow Andre Przywara's public A733
> reference and the A523 precedent. The CPUX interconnect diagram in
> section 5.1.2 supports noncoherency as an integration inference. The
> ITS stays disabled pending its clock/reset and MSI integration.
>
> Describe the single DynamIQ unit and shared L3 shown in section 5.1.2
> (figure 5-1). The big and little DVFS groups can be described by their
> clocks, OPP tables and supplies. Partition PPI 7 (section 12.2.3,
> table 12-1) between the Cortex-A55 and Cortex-A76 PMUs so each probes
> its own core type. Defer capacity-dmips-mhz until it is measured on A733.
>
> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b3529=
86b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
> Link: https://github.com/radxa/allwinner-bsp/blob/2045a3ca2a01f088c0314dc=
924bda59d154e363e/drivers/pinctrl/pinctrl-sun60iw2.c#L1591-L1610
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>
> v4 -> v5: Rename osc to hosc and add the I2C0 PG8/PG9 group. Keep the
> one-cluster CPU map and the two PMU partitions.
>
> Untested on v5: physical CPU/cache topology, PMU counting, EL2
> interrupt delivery and ITS/MSI.
>
>  .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 663 ++++++++++++++++++
>  1 file changed, 663 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/=
boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 000000000000..8a258f16751e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> @@ -0,0 +1,663 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +#include <dt-bindings/clock/sun6i-rtc.h>

This one goes after the clock/allwinner,sun60i-* ones.

> +#include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
> +#include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>

Here.

> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
> +#include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>
