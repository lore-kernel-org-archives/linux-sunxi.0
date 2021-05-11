Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D04829CA
	for <linux-sunxi@lists.linux.dev>; Tue, 11 May 2021 05:21:41 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id n2so27859794ejy.7
        for <linux-sunxi@lists.linux.dev>; Mon, 10 May 2021 22:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o7qvVYTxIMvAfWp7wQVxyaZrRU/DExjEtTnActjnLoY=;
        b=CUvd21dZicHSdFcB2WKTwesV82JRksY6kwmw63mPPVEIqln3djKwKo0ohzdHfRpoC0
         ciPwj/lBWy8yZpu/Q8/rtDpybfjlNpChL1jFK+8GTyg1ixnYGQLU060m14an8Y/IfY5+
         7TZN9rEX38BiBVOXNXwO5Wocx9dVszZG5bAoRuXTO5eCUmMgS9m01Awxk420gZ/pV381
         MQ8cwvNDdTQL7Ogmvj+9QcnHqyBHIRd+4YPecYMlAI/LePaAjh7oyR7HVni0VVkEbWlm
         lKDKUgntZnzejJ5MpdpHFhr471/bDu22Qpo6thTOh+VRl9DZVz/8jJPCrEfbRMh/OI8O
         qTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o7qvVYTxIMvAfWp7wQVxyaZrRU/DExjEtTnActjnLoY=;
        b=BPz36Kvqb0Fgr/G397Glg4wcBUm6Oj7sC/VaFajV7JgfYNbMSvnnGkMfEmEctFK8NM
         u0rVekvYYNuXgOfNI77z0FlVNcI1JO2/bV5iKGpyiunoLDJ8NLLAGOzMZThY1z3qR0dt
         o1dwCzZwhHgpX4hTlDLyXU1sxI0M6BH7gBT3Sww0fhDAzRaExH2it9GkgHJLsBzco66h
         J/CyxSCxpneFEbl961sEeodgQpCiZ/R/mz1FCElZidj9Y+Kx8wi3lZe7Q/r7pvs+gfmp
         NRYD+WNeIDlnrrUTcKHKnGujvRpAptPe0VE5qHTMjYDs2r3ucPahiXQKPJ6mtJQSyfAp
         ceRw==
X-Gm-Message-State: AOAM533aOjeJ2UW8d0NSqNSKtJTDUz+as10eF/fHS9BbhYWAvnRi6hzD
	67hJnOOtuytyjwuaggJubNnYpKm2ae0Be9TuODR0Bw==
X-Google-Smtp-Source: ABdhPJxXDOxOInJbvAi7HHYEeYbA2V9jdKzkjQD1c3CtgM+zhQj43lQN1OUFreObmxolmlLp1EYRdC3tFAoh8sBWeMU=
X-Received: by 2002:a17:906:85da:: with SMTP id i26mr29846987ejy.287.1620710499783;
 Mon, 10 May 2021 22:21:39 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210503142905.21468-1-amadeus@jmu.edu.cn>
In-Reply-To: <20210503142905.21468-1-amadeus@jmu.edu.cn>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 11 May 2021 10:51:28 +0530
Message-ID: <CA+G9fYsRZswjeDZj1hiGDu5HZ+jYCVsOOL6MAzEb=LVfQ1_NpA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: h5: Add NanoPi R1S H5 support
To: Chukun Pan <amadeus@jmu.edu.cn>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@siol.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-sunxi@lists.linux.dev, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 May 2021 at 20:09, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> The NanoPi R1S H5 is a open source board made by FriendlyElec.
> It has the following features:
>
> - Allwinner H5, Quad-core Cortex-A53
> - 512MB DDR3 RAM
> - 10/100/1000M Ethernet x 2
> - RTL8189ETV WiFi 802.11b/g/n
> - USB 2.0 host port (A)
> - MicroSD Slot
> - Serial Debug Port
> - 5V 2A DC power-supply
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Linux next tag next-20210511 arm64 build failed due to this error.

Error: /builds/linux/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts:35.15-16
syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [/builds/linux/scripts/Makefile.lib:365:
arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dtb] Error 1
make[3]: Target '__build' not remade because of errors.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

#regzb introduced: 7c9dbeda744f ("arm64: dts: allwinner: h5: Add
NanoPi R1S H5 support")


> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts | 194 ++++++++++++++++++
>  2 files changed, 195 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts


steps to reproduce:
--------------------------
# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch arm64 --toolchain gcc-9
--kconfig defconfig --kconfig-add
https://builds.tuxbuild.com/1sNFFZazb6TLzCYLxNoyIcWs0eU/config


metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: 4bf27b1f73303c33c5570b63f8ed734abcd1991f
  git describe: next-20210511


--
Linaro LKFT
https://lkft.linaro.org
