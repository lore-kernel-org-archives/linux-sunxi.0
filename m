Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC0533067A
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 12:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766492989; cv=none; b=sNUMeFqnp7dQMOXf60wLIeYJ0AyuEu6bCX6xJ3dh0sK/5o9Ut70AA6k6+cxv2GcEBRpoDeSsNzDszMbut4ac7WY/G95DxOHke8yi3dv0jIaunwKt/zw82ngEUwWe1RTKAWaA3CbPPfyuu7WWf/TFeW1ieKCGBRHe2p17HS9WWIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766492989; c=relaxed/simple;
	bh=h6OXWNpcTZmo3fq5/Hn/HjwTOV2GaxRDyFEHGkPfSDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BI6PzIHYh8mrFJG4BTFT4fExPenfRLwcNix1mqcgHsnoByD6kCzMKB7ELLFlZ3u877KVImnLqRL70FgQiN3tKDl2cL/oU+Q7ayM3i/LOZzHRpWtq6Pi9lpS2CtOugG5A6ScHAInbIUnpCRpUpvcEN0313IYIg1y3HnRckD7Oxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iqX1R9Xr; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iqX1R9Xr"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a33b06028so43409571fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 04:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1766492985; x=1767097785; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6OXWNpcTZmo3fq5/Hn/HjwTOV2GaxRDyFEHGkPfSDM=;
        b=iqX1R9XrVGr72dnx+2wiHkLP6s/NF4zUzr0UtCuTfUxLqtfBKBoq0IMbVNbQKbD2eD
         6Bft9xTcwuHlbm/gSnA6z087l59fZcce2fDGYPiJc77uD5mCli2lpc9QiFT1PhsGy5Ek
         cYqZL5bQzVb5E5p9Lx+qXATA8DsMW2kZuhfiWx0Ib2NvMZUaeV40bIOgeaidAHfZwVuR
         w8WJ/s2uyrOXsg4BRk5rxzan/wKg1NKEcFfTP6AmABaUJN2H/YXpoMR+wVUNNBsqdIRt
         0SeHyVf2xgfhy06hNDie5SeU3D4T7zE3nmwyS7mODQ6fc1zCgcwOY7hAYzdAHfXa0MxG
         uwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766492985; x=1767097785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h6OXWNpcTZmo3fq5/Hn/HjwTOV2GaxRDyFEHGkPfSDM=;
        b=K+txRIjFsPE1MmpOEHet7dbBfOHjSp4aysAPFCXVr+3d+Bqx1IWE7zt8JNhNuZ7jU8
         2tP9CmjMZOQQTl+lRIgRDR/ks18crhY5lJEkwg9qzIRWkLBGIix7e8PAD4YVAv+5UlHD
         zzFPKHUvINMbxls9Q550tEticAxMhZX9uBmbD7VpWA+ygW5sAyIS5EpNEORpY28RtkZO
         yj/yBn/OjtY9CyN1xqlXlI7oZ/7DDJTLImPCn7UUEQS9LMCJs9mI0cGfTOoqTZuH3zg6
         2qFZ/cqSb3VKT/ix+u0skWezZtfXrDCCkdJpc1HmrAqRR8AMaLd1OCIU/r20FnjM8JcW
         pPdg==
X-Forwarded-Encrypted: i=1; AJvYcCV3I7YSHSR+RJ0wkdsAU1aMIMvB/y9OvpQ7QP/dLjBTxKXv2+1IvnjEb1ssmWXDxY1RSvlrNUJyRx9mDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvILKa/nqEkyTstZG0XOt+YoXcYVR7sfO2QXhd3KRehS5GtyTR
	v0xkFumV406fv6IWoPRN44yqUF9hdui4hjUCjbHddZEZDYPxLxi0QhCiInJHcAKJ4AkugVMQf7Q
	mPyrhkPQ3bw7UfZ+TXSbtILAHvoskky1e7hNa1cgVkQ==
X-Gm-Gg: AY/fxX7+IDKecGPgv0CEuOV609DbQWHVf95vv7ybzdBxv8EYUibxwRIim6UqrfOs68C
	j37FUfdREk3U0kUR2uKos3OnuF3OEXEq5eEyRBGbzL+P2Dh4rmErmEs4sJtxLqY31gwR3wHzaCM
	yLarvCqAxbcr8Sn2sw7gPgXLyJh7RgQNqDbnL79aViebN20LzhOl8CGhVy710pGnV1v9AOCbAgc
	wfVALhX5qYAAHnhLJ704YxMQ35k2z60CyuYu88+GxxZ2dKSsmS9KKDZEDfv0V9K5z2K0pBi5tof
	b9L7jApg3fCC5KSdxrti8Le/DMQDCWbgpddyHQ==
X-Google-Smtp-Source: AGHT+IEBOhkGPqyyAQ1vT8Z9LQwcalYcPegEonjbT0vsHKYCaYN4/Y7HunNV2ZOFRdC/NVauUA6SJStJulcaNDLUuvw=
X-Received: by 2002:a2e:a7cf:0:b0:37a:45b0:467a with SMTP id
 38308e7fff4ca-3812158ffe9mr48663611fa.5.1766492985167; Tue, 23 Dec 2025
 04:29:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com> <51c7048a-52dc-47e1-97c3-2aa0d6555643@redhat.com>
In-Reply-To: <51c7048a-52dc-47e1-97c3-2aa0d6555643@redhat.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Dec 2025 13:29:32 +0100
X-Gm-Features: AQt7F2oUd4L6z6INXPzdFurDETLUQbJOAVCbMRjbjb79EkFyrJjgdrXB0o2w2nA
Message-ID: <CAMRc=Me7++jcT8SpA309F-0XoZvHPQF2Hfr17+Kt=Jmdy635pg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
To: Paolo Abeni <pabeni@redhat.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Matthew Gerlach <matthew.gerlach@altera.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 12:42=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 12/19/25 12:42 PM, Bartosz Golaszewski wrote:
> > Add support for the firmware-managed variant of the DesignWare MAC on
> > the sa8255p platform. This series contains new DT bindings and driver
> > changes required to support the MAC in the STMMAC driver.
> >
> > It also reorganizes the ethqos code quite a bit to make the introductio=
n
> > of power domains into the driver a bit easier on the eye.
> >
> > The DTS changes will go in separately.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Quite unusual SoB chain... I think it would be better if you could stick
> to one or the other; also the subj prefix should include the target tree
> (net-next in this case); finally...
>

That's totally normal. I did most of the work on this series while
still on Linaro payroll and credit is due. However I'm respinning them
now as a Qualcomm employee and it's no different than taking someone
else's patches and resending them - you have to add your SoB.

> ## Form letter - net-next-closed
>
> The net-next tree is closed for new drivers, features, code refactoring
> and optimizations due to the merge window and the winter break. We are
> currently accepting bug fixes only.
>
> Please repost when net-next reopens after Jan 2nd.

Sure, thanks.

Bart
