Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF012451A
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Aug 2023 21:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8301BC433C7;
	Wed,  9 Aug 2023 21:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691616018;
	bh=L/Kbe5Gv+2x9waWRb737fsvr0q13/uRIo/ViIcnUiGQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IQpAWA7u7FUhn80PVqoUntFbTSWbn0OFMFI5YK5+PBdD8IFnGSELcB5IzALKFj4sl
	 UOmmOOd3u42fXSIFvVFDXmqCRUfodusbH4N/5ZpRfiwxoOgyu9vgtwkDSLiKEvTMmj
	 JQq6B1lD5HwYaAqLhZIwdEupFaUHWpvx8zQ9dehibyBg0eQ1nJBRiOGvmtf9fuDdwI
	 NNXwbDg3K3H/4Ew8V+hSrv4f/Sw5MAgRuDBPyt3jH3BnlxQsRJGgNOHXOketduc1jv
	 RRW5uCNahYtS0lp9J+uaKOTaS5niZ8LSfe94w7pqVqjQRlLLk/5GeQTDncU4mLLbSA
	 zK6RXZ+WVcz0A==
Message-ID: <d8ec5cb220719c8900140b04c3990a46.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230806180448.GA126918@jernej-laptop>
References: <20230806180448.GA126918@jernej-laptop>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.6
From: Stephen Boyd <sboyd@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
To: Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date: Wed, 09 Aug 2023 14:20:16 -0700
User-Agent: alot/0.10

Quoting Jernej Skrabec (2023-08-06 11:04:48)
> Hi!
>=20
> Please pull following clock changes for 6.6.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaa=
a5:
>=20
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.6-1
>=20
> for you to fetch changes up to 075d9ca5b4e17f84fd1c744a405e69ec743be7f0:
>=20
>   clk: sunxi-ng: Modify mismatched function name (2023-07-31 00:52:36 +02=
00)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
