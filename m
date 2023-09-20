Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7B414F9D
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Sep 2023 10:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1A7C433C8;
	Wed, 20 Sep 2023 10:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695205049;
	bh=2GkMiHqg9sq9SZEmPAc01J1quP+f8aHeEiVc3hmQocU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GF8a50HawJYLOlS2QeGier++pT1CS93laWZ2hJh5XOdEDJptOMg5jbEr/gxtEfeaW
	 Z5SGOuydeVwYmvT3z7SwoXI/lDSFfYV8cq6Gya/pENqRZosg9DYhQg2W/CxwWEE3cx
	 7SOyqP0i1HLHWRgz5RLcNlC8Ahd9/nkPvxM9HTJqJe8BU6OCMwmk+GvEINcJDIaBFf
	 7KnRzfWFR8MSentrLzAlMY/TtRyR/kAUzKgO6ey25dBzgXi+nzOQlayYHHEB8iLRYb
	 LcCAAOOZNbfBG1LcXvnGu8QBCLLo3aQiTe1s+5X5Yz9hfbLo8oO0ZZh2yHnlg1K+3K
	 uDWfK7ICdMj1Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Shengyu Qu <wiagn233@outlook.com>, Martin Botka <martin.botka1@gmail.com>, 
 Matthew Croughan <matthew.croughan@nix.how>
In-Reply-To: <20230828213229.20332-1-andre.przywara@arm.com>
References: <20230828213229.20332-1-andre.przywara@arm.com>
Subject: Re: (subset) [PATCH v2] mfd: axp20x: Generalise handling without
 interrupt
Message-Id: <169520504804.3372408.2783524307415169045.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 11:17:28 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2

On Mon, 28 Aug 2023 22:32:29 +0100, Andre Przywara wrote:
> At the moment we allow the AXP15060 and the AXP806 PMICs to omit the
> interrupt line to the SoC, and we skip registering the PEK (power key)
> driver in this case, since that crashes when no IRQ is described in the
> DT node.
> The IRQ pin potentially not being connected to anything does affect more
> PMICs, though, and the PEK driver is not the only one requiring an
> interrupt: at least the AC power supply driver crashes in a similar
> fashion.
> 
> [...]

Applied, thanks!

[1/1] mfd: axp20x: Generalise handling without interrupt
      commit: e928aaf249755fd3c1659dece4a23e089534f66f

--
Lee Jones [李琼斯]

