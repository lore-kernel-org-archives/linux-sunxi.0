Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3C18C2E
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Aug 2023 16:45:07 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6bc886d1504so7432a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Aug 2023 09:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691599506; x=1692204306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/ppIpNykOtbP/6R4ynNuZ5RP4Dl5BB7MG8fQ5sVPJQ=;
        b=HITTXA+2vMQVEqpjyFQv5G4ta/dVcBYE34vvFizqKyPUwggqBz2eKv9RaTctwAzA34
         FlSoewyvxxf29LUtMBA/FiWMVahyvD8852Z1F0W7nVsSdyzUbrIn/TCcY1036ZAlx5F3
         eZA0fjXUmJGOQVQB4wnR5ms1jTpDWFmP2qlzevbf3bxs8sVccS4gAVA7BmoKpgeCJE5K
         37TCqB/QzVo/sIiST72xC/HsrIuYEuhuH0ll9T26+pK/ipQj44gUYM9h+Pqrg/lIF70U
         fBrK1v1VN5P5oQxqP2IaeCIuaoM9zDYbqmt7ZJ4dO/nR6huKVxP2loZJVZcg+8XxNcnE
         dgHw==
X-Gm-Message-State: AOJu0YzaC0oB3TkwddkFCdTnWfIvCr6pUsW2VRgRnD54F0jHTkbSqxI8
	sMDE7tYKGM6VV2cJ08OahHvmk0iCACP6Sg==
X-Google-Smtp-Source: AGHT+IFr3N8MQProS2WBW3V01EXajjCRPpTeANTYjqt4Sr9pda7BE5bLKlaK4PSnxeXgLRmq7D/JMQ==
X-Received: by 2002:a05:6830:16d9:b0:6b7:493d:69ae with SMTP id l25-20020a05683016d900b006b7493d69aemr3480056otr.31.1691599506509;
        Wed, 09 Aug 2023 09:45:06 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id b8-20020a056830104800b006b71a4567absm7058576otp.58.2023.08.09.09.45.05
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 09:45:05 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-56c87f89178so29397eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Aug 2023 09:45:05 -0700 (PDT)
X-Received: by 2002:a05:6808:211e:b0:3a3:ffb7:1dd4 with SMTP id
 r30-20020a056808211e00b003a3ffb71dd4mr3716240oiw.6.1691599505466; Wed, 09 Aug
 2023 09:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev>
In-Reply-To: <20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 10 Aug 2023 00:44:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dU2Ao9hBiwgu32i7_svqMT+Pz=BVnN0ZvmLhFm+jy6A@mail.gmail.com>
Message-ID: <CAGb2v66dU2Ao9hBiwgu32i7_svqMT+Pz=BVnN0ZvmLhFm+jy6A@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] clk: sunxi-ng: Consider alternative parent rates
 when determining NKM clock rate
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, Roman Beranek <me@crly.cz>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 8:44=E2=80=AFPM Frank Oltmanns <frank@oltmanns.dev> =
wrote:
>
> This patchset enables NKM clocks to consider alternative parent rates
> and utilize this new feature to adjust the pll-video0 clock on Allwinner
> A64.
>
> Furthermore, with this patchset pll-video0 considers rates that are
> higher than the requested rate when finding the closest rate. In
> consequence, higher rates are also considered by pll-video0's
> descandents. In total, after applying this patchset, finding the closest
> rate is supported by:
>   - ccu_nm
>   - ccu_nkm
>   - ccu_mux
>   - ccu_div
>
> This allows us to achieve an optimal rate for driving the board's panel.
>
> To provide some context, the clock structure involved in this process is
> as follows:
>     clock                       clock type
>     --------------------------------------
>     pll-video0                  ccu_nm
>        pll-mipi                 ccu_nkm
>           tcon0                 ccu_mux
>              tcon-data-clock    sun4i_dclk
>
> The divider between tcon0 and tcon-data-clock is fixed at 4. Therefore,
> in order to achieve a rate that closely matches the desired rate of the
> panel, pll-mipi needs to operate at a specific rate.
>
> Tests
> =3D=3D=3D=3D=3D
> So far, this has been successfully tested on the A64-based Pinephone
> using three different panel rates:
>
>  1. A panel rate that can be matched exactly by pll-video0.
>  2. A panel rate that requires pll-video0 to undershoot to get the
>     closest rate.
>  3. A panel rate that requires pll-video0 to overshoot to get the
>     closest rate.
>
> Test records:
>
> Re 1:
> -----
> Panel requests tcon-data-clock of 103500000 Hz, i.e., pll-mipi needs to
> run at 414000000 Hz. This results in the following clock rates:
>    clock                            rate
>    -------------------------------------
>     pll-video0                 207000000
>        hdmi-phy-clk             51750000
>        hdmi                    207000000
>        tcon1                   207000000
>        pll-mipi                414000000
>           tcon0                414000000
>              tcon-data-clock   103500000
>
> The results of the find_best calls:
> ccu_nkm_find_best_with_parent_adj: rate=3D414000000, best_rate=3D41400000=
0, best_parent_rate=3D207000000, n=3D1, k=3D2, m=3D1
> ccu_nkm_find_best_with_parent_adj: rate=3D414000000, best_rate=3D41400000=
0, best_parent_rate=3D207000000, n=3D1, k=3D2, m=3D1
> ccu_nkm_find_best_with_parent_adj: rate=3D414000000, best_rate=3D41400000=
0, best_parent_rate=3D207000000, n=3D1, k=3D2, m=3D1
> ccu_nkm_find_best_with_parent_adj: rate=3D414000000, best_rate=3D41400000=
0, best_parent_rate=3D207000000, n=3D1, k=3D2, m=3D1
> ccu_nkm_find_best: rate=3D414000000, best_rate=3D414000000, parent_rate=
=3D207000000, n=3D1, k=3D2, m=3D1
>
> Re 2:
> -----
> Panel requests tcon-data-clock of 103650000 Hz, i.e., pll-mipi needs to
> run at 414600000 Hz. This results in the following clock rates:
>    clock                            rate
>    -------------------------------------
>     pll-video0                 282666666
>        hdmi-phy-clk             70666666
>        hdmi                    282666666
>        tcon1                   282666666
>        pll-mipi                414577776
>           tcon0                414577776
>              tcon-data-clock   103644444
>
> The results of the find_best calls:
> ccu_nkm_find_best_with_parent_adj: rate=3D414600000, best_rate=3D41457777=
6, best_parent_rate=3D282666666, n=3D11, k=3D2, m=3D15
> ccu_nkm_find_best_with_parent_adj: rate=3D414600000, best_rate=3D41457777=
6, best_parent_rate=3D282666666, n=3D11, k=3D2, m=3D15
> ccu_nkm_find_best_with_parent_adj: rate=3D414577776, best_rate=3D41457777=
6, best_parent_rate=3D282666666, n=3D11, k=3D2, m=3D15
> ccu_nkm_find_best_with_parent_adj: rate=3D414577776, best_rate=3D41457777=
6, best_parent_rate=3D282666666, n=3D11, k=3D2, m=3D15
> ccu_nkm_find_best: rate=3D414577776, best_rate=3D414577776, parent_rate=
=3D282666666, n=3D11, k=3D2, m=3D15
>
> Re 3:
> -----
> Panel requests tcon-data-clock of 112266000 Hz, i.e., pll-mipi needs to
> run at 449064000 Hz. This results in the following clock rates:
>    clock                            rate
>    -------------------------------------
>     pll-video0                 207272727
>        hdmi-phy-clk             51818181
>        hdmi                    207272727
>        tcon1                   207272727
>        pll-mipi                449090908
>           tcon0                449090908
>              tcon-data-clock   112272727
>
> The results of the find_best calls:
> ccu_nkm_find_best_with_parent_adj: rate=3D449064000, best_rate=3D44909090=
8, best_parent_rate=3D207272727, n=3D13, k=3D2, m=3D12
> ccu_nkm_find_best_with_parent_adj: rate=3D449064000, best_rate=3D44909090=
8, best_parent_rate=3D207272727, n=3D13, k=3D2, m=3D12
> ccu_nkm_find_best_with_parent_adj: rate=3D449090908, best_rate=3D44909090=
8, best_parent_rate=3D207272727, n=3D13, k=3D2, m=3D12
> ccu_nkm_find_best_with_parent_adj: rate=3D449090908, best_rate=3D44909090=
8, best_parent_rate=3D207272727, n=3D13, k=3D2, m=3D12
> ccu_nkm_find_best: rate=3D449090908, best_rate=3D449090908, parent_rate=
=3D207272727, n=3D13, k=3D2, m=3D12
>
> Changelog:
> ----------
> Changes in v6:
>  - Removed unnecessary #include from ccu_nkm.c
>  - Link to v5: https://lore.kernel.org/r/20230806-pll-mipi_set_rate_paren=
t-v5-0-db4f5ca33fc3@oltmanns.dev
>
> Changes in v5:
>  - Remove the dedicated function for calculating the optimal parent rate
>    for nkm clocks that was introduced in v2 and again in v4. Instead use
>    a simple calculation and require the parent clock to select the
>    closest rate to achieve optimal results.
>  - Change the order of parameters of nkm_best_rate and
>    nkm_best_rate_with_parent_adj as requested my Maxime Ripard.
>  - Prefer to not reset the rate of the nkm clock's parent if the ideal
>    rate can be reached using the parent's current rate, copying the
>    behavior of ccu_mp.
>  - Link to v4: https://lore.kernel.org/r/20230717-pll-mipi_set_rate_paren=
t-v4-0-04acf1d39765@oltmanns.dev
>
> Changes in v4:
>  - Re-introduce a dedicated function for calculating the optimal parent
>    rate for nkm clocks that was introduced in v2 and removed in v3. It
>    turned out that not having this functionality introduces a bug when
>    the parent does not support finding the closest rate:
>    https://lore.kernel.org/all/87pm4xg2ub.fsf@oltmanns.dev/
>  - Incorporate review remarks:
>     - Correcting the parameter name for ccu_nkm_round_rate()'s parent HW
>       is now in a separate patch.
>     - Use correct parameter order in ccu_nkm_find_best_with_parent_adj.
>     - Add ccu_is_better_rate() and use it for determining the best rate
>       for nm and nkm, as well as ccu_mux_helper_determine_rate.
>     - Consistently introduce new macros for clock variants that support
>       finding the closest rate instead of updating existing macros.
>     - Use wrapper function for determining a ccu_mux's rate in order to
>       support finding the closest rate.
>  - Link to v3: https://lore.kernel.org/r/20230702-pll-mipi_set_rate_paren=
t-v3-0-46dcb8aa9cbc@oltmanns.dev
>
> Changes in v3:
>  - Use dedicated function for finding the best rate in cases where an
>    nkm clock supports setting its parent's rate, streamlining it with
>    the structure that is used in other sunxi-ng ccus such as ccu_mp
>    (PATCH 1).
>  - Therefore, remove the now obsolete comments that were introduced in
>    v2 (PATCH 1).
>  - Remove the dedicated function for calculating the optimal parent rate
>    for nkm clocks that was introduced in v2. Instead use a simple
>    calculation and require the parent clock to select the closest rate to
>    achieve optimal results (PATCH 1).
>  - Therefore, add support to set the closest rate for nm clocks (because
>    pll-mipi's parent pll-video0 is an nm clock) and all clock types that
>    are descendants of a64's pll-video0, i.e., nkm, mux, and div (PATCH 3
>    et. seq.).
>  - Link to v2: https://lore.kernel.org/all/20230611090143.132257-1-frank@=
oltmanns.dev/
>
> Changes in V2:
>  - Move optimal parent rate calculation to dedicated function
>  - Choose a parent rate that does not to overshoot requested rate
>  - Add comments to ccu_nkm_find_best
>  - Make sure that best_parent_rate stays at original parent rate in the u=
nlikely
>    case that all combinations overshoot.
>
> Link to V1:
> https://lore.kernel.org/lkml/20230605190745.366882-1-frank@oltmanns.dev/
>
> ---
> Frank Oltmanns (11):
>       clk: sunxi-ng: nkm: Use correct parameter name for parent HW
>       clk: sunxi-ng: nkm: consider alternative parent rates when determin=
ing rate
>       clk: sunxi-ng: a64: allow pll-mipi to set parent's rate
>       clk: sunxi-ng: Add feature to find closest rate
>       clk: sunxi-ng: Add helper function to find closest rate
>       clk: sunxi-ng: nm: Support finding closest rate
>       clk: sunxi-ng: nkm: Support finding closest rate
>       clk: sunxi-ng: mux: Support finding closest rate
>       clk: sunxi-ng: div: Support finding closest rate
>       clk: sunxi-ng: a64: select closest rate for pll-video0
>       clk: sunxi-ng: nkm: Prefer current parent rate

Whole series applied. There were some conflicts on patch 10 I had to
fix up. I also took the liberty of realigning some of the lines.
Please check if things are correct:

https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/commit/?h=
=3Dsunxi/clk-for-6.6&id=3Dbf8eb12f52c49e10ca1d86564bfa096e09c51c38

ChenYu

>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 36 ++++++++++-------------
>  drivers/clk/sunxi-ng/ccu_common.c     | 12 ++++++++
>  drivers/clk/sunxi-ng/ccu_common.h     |  6 ++++
>  drivers/clk/sunxi-ng/ccu_div.h        | 30 +++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_mux.c        | 15 ++++++++--
>  drivers/clk/sunxi-ng/ccu_mux.h        | 38 +++++++++++++++++-------
>  drivers/clk/sunxi-ng/ccu_nkm.c        | 55 +++++++++++++++++++++++++++++=
+-----
>  drivers/clk/sunxi-ng/ccu_nm.c         | 13 ++++-----
>  drivers/clk/sunxi-ng/ccu_nm.h         | 48 ++++++++++++++++++++++++++++-=
-
>  9 files changed, 202 insertions(+), 51 deletions(-)
> ---
> base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1
> change-id: 20230626-pll-mipi_set_rate_parent-3363fc0d6e6f
>
> Best regards,
> --
> Frank Oltmanns <frank@oltmanns.dev>
>
