Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75422C9C
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Oct 2022 13:27:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1665667617; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WHTvBdGxIf26GKqyiIENSK58oGpJ5b9K/d8WRFskCocYO0xgZEo4PUEuPy4tOcY34D7IY6M68NATefiqrhkcOcMwTRdRL78Sknn+SrfrVqQPh8P96Giz1EMimGaWaM/z9RKKj0nTXO8wF6ybck8UG1jZim5+tWJveyTtvSAfCcY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1665667617; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=6vZ20V3JcxOzLDRBh7mwHihDXfGpJzeibcFL0fNxaaA=; 
	b=gFp28EoTQDzxtxwNktQ1fRVr4WQVBn4+QUpJE44ZI+N7du0cRZP/LLMcEhAbKGKTmNx3hRSEOCddzYAYhkhpGBqYZ8GeUmL/7xnw+JsT7GfaK7V/ZM07tpFm+npG/xR8NNM1Qde3FnNzAxErJ5/5p08RcD5CEj/cF9n4AszdxSQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1665667617;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=6vZ20V3JcxOzLDRBh7mwHihDXfGpJzeibcFL0fNxaaA=;
	b=GHhG3gX8hGJzjM6g8THnuURfhEufID9Bn/VlhE/YuFrl3jHMG5+wYs0qBsim/aPH
	74dymsleT8wOa8tqzmRZg9+X3rhvnwBcj3i+M6a8xBI8jktDuBZTj9f6a/7606NW6Nz
	8AaDWs19YvpbnhURd6Ao5WYH9fnPy/G8P7pZFW4M=
Received: from edelgard.fodlan.icenowy.me (112.94.102.144 [112.94.102.144]) by mx.zohomail.com
	with SMTPS id 1665667615806229.6030658935067; Thu, 13 Oct 2022 06:26:55 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 0/2] sunxi: fix SUNIV D$ support
Date: Thu, 13 Oct 2022 21:26:43 +0800
Message-Id: <20221013132645.2469041-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Currently D$ support of SUNIV is broken because of duplicated definition
of the D$ enabling function.

Mask the one in mach-sunxi to fix the build error when D$ is enabled,
and enable the D$ on Lichee Pi Nano.

Icenowy Zheng (2):
  sunxi: fix SUNIV build when enabling D-Cache
  configs: sunxi: licheepi_nano: enable D-Cache

 arch/arm/mach-sunxi/board.c     | 2 +-
 configs/licheepi_nano_defconfig | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.37.1

