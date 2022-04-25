Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7EE33DE
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 23:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FDFC385A9;
	Mon, 25 Apr 2022 23:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650930524;
	bh=tUUuiAFPaMgRSJByGoGe+z0kBD778AoJmtWJqA6I9+U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=erJCa6LOMAbEBaHkVL5faM1SZk8nJDLgBtuqTR8ozKO6UPSAZxMD03W4Y+TJsEpqL
	 r5TDGoEJZAJ5zow455YvZTPuF8HZGJHTvcjDAhfmpv+Dgu3iFWoYuExcxD0Ik/+Qmf
	 bCbueSfJMdOyiKUo9sHQoRH3KuaixhO02bN6GsVrBMoCtulCWjv0uAg7fvE+jRKjXd
	 A2mCejTrRaK+YI97J17ziOUiJFhP2FkW+mMoivkrz7MvFpTRZWxTcxbLWaA8n/aeEg
	 LbdO+aJpFNuh+STK+bryg0dnA/j32QXjgEFBqvOfLt/NMRR+Bys2BnHcdE4jVUASUB
	 lu77nPIkyAmDw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YmbiLbQmqIUec0fM@kista.localdomain>
References: <YmbiLbQmqIUec0fM@kista.localdomain>
Subject: Re: [GIT PULL] Allwinner clock fixes for 4.18, take 2
From: Stephen Boyd <sboyd@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
To: Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date: Mon, 25 Apr 2022 16:48:42 -0700
User-Agent: alot/0.10
Message-Id: <20220425234844.A9FDFC385A9@smtp.kernel.org>

Quoting Jernej Skrabec (2022-04-25 11:02:21)
> Hi!
>=20
> Please pull following changes for current release.
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
nxi-clk-fixes-for-5.18-2
>=20
> for you to fetch changes up to f58ca215cda1975f77b2b762903684a3c101bec9:
>=20
>   clk: sunxi: sun9i-mmc: check return value after calling platform_get_re=
source() (2022-04-25 19:50:53 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.
