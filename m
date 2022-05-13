Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8A13232
	for <linux-sunxi@lists.linux.dev>; Fri, 13 May 2022 11:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97F3C34117;
	Fri, 13 May 2022 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652442314;
	bh=Nh7c3G59JZNQpOo1OVyWEaFaB9hMXVQeFyDHofjTytU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gIOOBLOMVFTkuWojaqfZMn6lQhmiZkAiC2EiZyt1/ZrifB0SKrScxF1r1f6OC2YS5
	 oT7faHoRkmWTWjRKN73wS82sPk9RnWt6UgYDiE6jCBsH4VRPSuSnUY6T+Obx+VeIPo
	 Fh1ZQ5sfbRxa49wteo9hSQ0v/iActgbo9MEpxrTo9gqchAySEzUrz7+OaW4JzW/36I
	 0OCXksiBVWU619ZtCg9pp/d2fQQl99NwfhHJA+lGexJwadNuBNzzE9LVs/k9d6vci6
	 IO4YMYZ6gVky4ucISWdiUifTnCpSYZCtoIR+G9jwEowGVCzi6aackCvXamhk5Nm2xm
	 OW0lzofrCh1fQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Jernej Skrabec <jernej@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	wens@csie.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner DT changes for 5.19
Date: Fri, 13 May 2022 13:43:36 +0200
Message-Id: <165244216369.2862916.15862255531121841707.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YnVUmSLE1MZFkApt@kista.localdomain>
References: <YnVUmSLE1MZFkApt@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 6 May 2022 19:02:17 +0200, Jernej Skrabec wrote:
> Please pull following DT changes for 5.19.
> 
> Best regards,
> Jernej
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 73ff4d189bae17cb2aa783611ec80ba63b9c57ae

       Arnd
