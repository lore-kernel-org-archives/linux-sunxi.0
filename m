Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666417B
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Nov 2022 00:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC912C433C1;
	Wed, 23 Nov 2022 00:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669164885;
	bh=H42ZrAGgQp/aCjsbJiVaMdE+eoEzsGgFCxgylcY/DCY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kt8NmAcS2dXi/9s6Llk3GZaxVjNCX9Y7kyrZq0+CSo77l8Axkc/Lop2MuMjpaawkW
	 5ZSigxDeCM7+NZAbBz9yAUxLNocJr83RLr0/TYDNKScSSnB77lM7j0ryc5hEb6ISvf
	 GXv0YmoZtIIrOZZa7HlHGj1suNPtpiCcKOZ+D3pxxpSrLRt2bEdyHzL1C+s5Fin0Do
	 PiI2jU8gdk5ZnstKUCrBaa75Hj4GwNFp2e/QnesIZ6fgk4bgWiqbY41YsCNOthL+G2
	 LDEvdS9+uXasAagL07m1wpbQrgyicZpZwfMfDNwvy0I8HhEt1FOKPLeihrnvr0i5bG
	 nfpZPIox9A9JA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y3ftFp9FoTmGCi9+@jernej-laptop>
References: <Y3ftFp9FoTmGCi9+@jernej-laptop>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.2, try 2
From: Stephen Boyd <sboyd@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
To: Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date: Tue, 22 Nov 2022 16:54:43 -0800
User-Agent: alot/0.10
Message-Id: <20221123005445.CC912C433C1@smtp.kernel.org>

Quoting Jernej Skrabec (2022-11-18 12:37:42)
> Hi!
>=20
> Please pull following clock changes for 6.2.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80:
>=20
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.2-1
>=20
> for you to fetch changes up to f64603c9729af406167cb9beb66687b1abc4196e:
>=20
>   clk: sunxi-ng: f1c100s: Add IR mod clock (2022-11-16 19:49:18 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
