Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABDB7F
	for <linux-sunxi@lists.linux.dev>; Tue, 17 May 2022 06:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF40C385B8;
	Tue, 17 May 2022 06:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652770725;
	bh=gKm7H4AV02a9TaJgozMTYe78+Ol2ViZO/6gqSbE0COo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qExlCGM9RFvLaGl5H+DgLsVFakLnAZknvRvEB07FA7PkM/rXsnJv1KkAyxAZI+wa+
	 cTvs3e8tahm5J24syEoQlfJke+XzjMVzQ2p7eeZihw/lzCYff8UZOODD4Lu5ifQcIn
	 jby2YUDJg6Hbf5X4WeVsngtY0MVVMPkAk2yHo0KB1/6eOscKspdbFJ6zq1KF1a9Hf9
	 2kJwttKMu3T2q5umqYOpFEB38xG28FPPaUHAi9dZvT7UZvG/IcsdUlCzQixE5/0hIo
	 y2wbB1sZOOivmYbL3iWfw7n6tiGJTZQxLrarwutWjdcSoOAp/wCRFfdyn0L3Eb7xN6
	 O/0i35xOfl46Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YnVLMm7t/NbwnDad@kista.localdomain>
References: <YnVLMm7t/NbwnDad@kista.localdomain>
Subject: Re: [GIT PULL] Allwinner clock changes for 5.19
From: Stephen Boyd <sboyd@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
To: Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date: Mon, 16 May 2022 23:58:43 -0700
User-Agent: alot/0.10
Message-Id: <20220517065845.9DF40C385B8@smtp.kernel.org>

Quoting Jernej Skrabec (2022-05-06 09:22:10)
> Hi!
>=20
> Please pull following clock changes for 5.19.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc=
17:
>=20
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-5.19-1
>=20
> for you to fetch changes up to 31ab5169803ebc009e01d1ee4501ca9faf347161:
>=20
>   clk: sunxi-ng: h616: Add PLL derived 32KHz clock (2022-05-06 18:03:52 +=
0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
