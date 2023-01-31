Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC747E
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Jan 2023 00:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6886FC433EF;
	Tue, 31 Jan 2023 00:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675123741;
	bh=c/OydjnrsePgwEapLpVtjj/oGE81b8mD5+qHxXBLwsY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HFlQrYji2nXoNpxUkzcNnuiWmBYJ7E3Wqn6Y1eZqdjUyNzLgFn8akKCmhCal6yHag
	 gBVtqnu3U0LkTycWmmGdZy92YBaMwIM3iIVj2SrOIOR/iTcPO0kM576osMAcHiZvtE
	 noE9sX0lBxMGgUtk9Kzr7E22UAwpja2f6hVF5P6uRgWxDNkepDssOf3TyIKLzPK7Nv
	 5lZL1v61tIK8BpJQr4AIHhstFKtD/lOsd89p/Tg5jZNjptPk2nAAfcNULjEsh6zxLH
	 /05g3RVK+tKUA/Mf/nXSiWuXgwGHXikx2XVYgX+3kjszx72rI+kJXFLxWnY4oOobKY
	 jSrmXcT3NQjnA==
Message-ID: <c1d64194f7ad95e66de3db104967da2c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y9RXFUH6URVE4LMG@jernej-laptop>
References: <Y9RXFUH6URVE4LMG@jernej-laptop>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
To: Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date: Mon, 30 Jan 2023 16:08:59 -0800
User-Agent: alot/0.10

Quoting Jernej Skrabec (2023-01-27 14:58:29)
> Hi!
>=20
> Please pull following clock changes for 6.3.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71=
c2:
>=20
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.3-1
>=20
> for you to fetch changes up to e6f2ffeaf58b23614cc818587aa3a4fc7c108a55:
>=20
>   clk: sunxi-ng: d1: Add CAN bus gates and resets (2023-01-08 22:06:10 +0=
100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
