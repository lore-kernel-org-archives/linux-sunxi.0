Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25751EE7C6
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Oct 2026 06:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352888; cv=none; b=mp8SeDu20Ot5tPxmeeG5hpimV18L1XlyLzzMdvAEsw8XeyKGd6fIWYvfQPUIbRR27AmQH+ThvZ+fGyiznmnMw3rxC4qo7eBK9syckXVCy/NbVppuLkEuv5oPTlXgInXiO0r7FoxNS0zQUGfHxYpCJ+fcNM6/09ZqwDPw53W3sCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352888; c=relaxed/simple;
	bh=fUkZRVZThPrAIiUI7nNS/oPVIqZ1p+N6QBHZ5r01/C4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dq85cSTXzypqyKKrRt//H1hybOqKgj6cvPQ/0sLOFPD0nOn8dsaYTUNwglPsTMsAle3PJCX2Z7RmoieGGNLpFexFAUkLJEMwixe5aSHNpzSVfFq7fUjAanFGfIPVGeQLd5vLJk8OVfcu7de3CllNc5A7lh6ZqGTGBXVwRyogfJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSZp/flQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSZp/flQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so9181885e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Oct 2026 23:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791352885; x=1791957685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPj6yjALXRppnwgH/9Fv6hsVla0KxfcdinEDCye/m1I=;
        b=sSZp/flQVx9gRiHGByZke2911VUEMbFU/pwwFZmCAMUQmj1yQYqe8ueVZXokVRpUn0
         ApJl76T/HPKkJfJ40XANBusDlC16v47u7ybiRn6EuL8Hl/v/w4AmBd83+lukpSy87Q8z
         EZl1XhL6PSvMSwd8q+p2FIgrd+KyncCRohhHumQgjy6j5ek37epGxHGME2ncF1VKBHfN
         /J8iz+1+cVXktu8Mf/9Tye/Et/ToLOaaiR4fDsMGWiOqtp+SiNC988bLBUdndgmmR4nv
         O5eIB81L7hyfm4kwh1bNKt9h5uFGT0yNFtd4lybRAxEKKhV/s9AbjQH/rOuqHVIFN1gp
         keBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352885; x=1791957685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPj6yjALXRppnwgH/9Fv6hsVla0KxfcdinEDCye/m1I=;
        b=k2L1EYicFIRQqbKXRQUKcIi1npL7F2eBS9Zi/UyKjxG4Q/WeHLdo4wb9xN7aHac3O5
         SfwZ/jBIEpvRWD0f/ofg8UPdtijXWqr8NC2rblY2lg18NwiZ7nAiJ2NI4alvnK5SeoN4
         /DkFHLbzAtsb6q5WXZVMe76gnPgQV8u8s17XeaXOwRpparLjdfQFMrdXxfspZAEm70bT
         mJS0f9MNoKv6QSn9h5ZDoIoQ784UzIFN5ubvWpVPmhvGYRU/QZyGS4s3Huw66qb+zZtB
         9N1+2p3F1Vn/TiaD1cGflmgX7DDuJMTHmsd5XuwqcNTQzhhbLC287x6YL5XYreVWDyK+
         MCGA==
X-Forwarded-Encrypted: i=1; AKwUvBz+7UXmSdgszTaY/sqm/SuikzrR9Yv4/LNuVLCi/KgUicLTo3n2JucE793BIZJIM9kxa9lONXn+QcW/KA==@lists.linux.dev
X-Gm-Message-State: AFuF++lVbhJMfa6lNvcM1LRWoPhA+9lpdzQ94wu+UwBrrWmOnNQ0NmE3
	H10JACKLXXsDCVVAx6FhlQ+Ws9nXP/O4/zp5MiTJ356wAhYGhwD3qWNj
X-Gm-Gg: AYBFou01UzvUkvCQPI38VSuhqPk70khjMP5BaIsTBb3kHKAv/4BbAU7QvUJqvMU2p0d
	7VHk9EvRyKX7vn5Gv0YnCBeClDw4L8exHTTT4dhzvzPfEYdA0VGpXQSvsDt1CIL8exwpS4rywe4
	/nitZO/mXdWxysTwXS5HQU8DN3iUjhHxGrkDp9BP+BzKic48FYS/WoIuBpJ9Rs0OxVTZiirfwHJ
	LaphnMXClGtHQVUVwUvXMGGsnznBlBg67wg9cn7xkiz9DMpoheeG2KMC1SpCbDpj2odQz+7tQfr
	CnA/BUl+bAnzeBW51oDTCOpwKQkzq8YRaB0l4atYVYMVOL1cjq1CfRFkrmfsTwh83Rcv0z65rai
	bFOmU5iIBVubqxwyhm3CX32CiRPBxH1Tafuy6QYUNQUFUsAoxg+1U4kyRL6LVI07SQf31gYheig
	jmsg2useRKJELII0jDPYvZeeWLOhsSDR5wK5qKRogx41M7dFkQN/qcEd+DoyQ=
X-Received: by 2002:a05:600c:314f:b0:4a0:1c69:f607 with SMTP id 5b1f17b1804b1-4a1806509b5mr13094935e9.29.1791352884569;
        Tue, 06 Oct 2026 23:01:24 -0700 (PDT)
Received: from debian.tfbnw.net ([2620:10d:c092:400::4:711b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4eac2csm49696235e9.0.2026.10.06.23.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:01:22 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: [PATCH v2] pinctrl: sunxi: dt: do not accumulate npins across probe attempts
Date: Wed,  7 Oct 2026 07:01:07 +0100
Message-ID: <20261007060107.62221-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_pins_table() adds to npins in the driver's static descriptor, so
after a probe deferral the count doubles and the next probe fails with
"pin 0 already registered". Reset it first.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
v2: reset npins instead of counting into a local (Andre)

 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..8bcd566593ae 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -84,6 +84,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 	 * Find the total number of pins.
 	 * Also work out how much memory we need to store all the pin names.
 	 */
+	desc->npins = 0;
 	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
 		desc->npins += pins_per_bank[i];
 		if (pins_per_bank[i] < 10) {
-- 
2.52.0

