Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C9C187FE0
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jan 2025 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735840433; cv=none; b=UXyswjcyyeuVNFwKriSHVXu8XVSjqoiL1pa+mfTZhBCiknzD0wXQk5GeH66sJijcHC1ZKRnZz4Qvu3RnuOXm2Rkocot/7ag44JGIXe+16icIhWyhuhL+Hge4LYQ6YayXgHhYcsoosdCTo1EOyVuWS4EHzmSg1mzYSE+J1fBrV/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735840433; c=relaxed/simple;
	bh=1shpE28iBcup65YtilFuONgZy7peN3Bq8T9nkbdyquk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oVSVNpRKGeJpNDrqRKgskkMx8EeDXI3PdS7hD9UheIY7SBFRumsshI5X8C6YFOpWR+cncMsC5SePR2ePFkXzJc9fdLDpQFVSi/0Y2ntLtpukJidnrfEx7qCGmtJ4ROIqS4p35Z79vjgfCdj3n6oUvPqiOpEyvdCHNgD0BlEnHuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=QZ4yzxNU; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="QZ4yzxNU"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=QIyYY0XK8X4RY7jfK1r1XszV7ED+QH8G9tLlmp8c7ws=;
	b=QZ4yzxNU5Ljte+k4V+6PqQhqe9gjQqNffdQj+vxPekK2PIZERjd6A7dqFNGGdR3//p24psXJKY1FVjhq2ZkVyFkWZySawa7I/UJ4kgCrWDIJQFlbaZcGJV8DEQxnrxvexEyC1CHmPWeay+5Oisc1fBMpVOeLSh2P56zLlVvKf/I=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Thu, 2 Jan 2025 18:53:37 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: 
Date: Thu,  2 Jan 2025 17:49:58 +0000
Message-Id: <20250102175006.3675-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
  Fix the devicetrees according to the dt-schema



