Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35BA451071
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717662; cv=none; b=mCwP9QGZw4eYtM3xZlHxhZEjxGxXb06JjMEFYL7K4YM7iPzusLN2jYgGqEmb7rhhCqIcZHTNMhebXyl5g/Rbq4Aih6KArUHsNDmi/hSC6ijMJbC16DQTUU4qF5Wgr5h/fchaT1vaZsr4lC3KxtPxYbqY1zsm9KaN8ZDiwi+X8ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717662; c=relaxed/simple;
	bh=0puQPuQWWulYAhnu3BLCOE1T6GpuWApgnYBpUlFGRLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C0k7kRjno47Lfnv5QN+Ynl6KwoIfH+Gu9gjaaUjw3gmg5uzoKMUfYpKaTrYss48T9DWotsZKx4oOTs24a6uMTTJvFhHM10hhlsRMrrL6LHKn0Te81XyVR0wFl+QscadW08rXqfvWd5BtGLFm8+sDPIZB6BDu0gqAQ2nEbtMYJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=vH/gyWvV; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="vH/gyWvV"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c160875e029so9312466b.3
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 07:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786717647; x=1787322447; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiRDm4IQnhuQ7LPoTTfQGjc9v5HsytEDBpwNIg9MWYw=;
        b=vH/gyWvVl3oSxVXEoK461GSKm67DoyTxHnyuFNlk9YodRacIdvxqqdsKxppcFv4xse
         5y5OpFaiiFN3aznAKqWoG6sn/on49zKl5rB5fVJNouUFHZqoBE3pcPgqASNrhlzNhug6
         BsoneBgSrhew5L5GGto6BKIY4cAM+nOkxfxWG6LFIpXcewsIx2k3T/tiXy30XPi0hYSM
         DPmpVKKrAeMTBHt6RXZNIUr4eI1B/gTt/Ogz7TI7nQIWJo5fkrKFpqOld+P2Q/63NdJN
         qqTlFMKf1OlO9ledDODImA9iVHUuczbvJWwXeIyf9ff5CwnVgTVbvq8vnrpvMTS9HpvV
         +Stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717647; x=1787322447;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiRDm4IQnhuQ7LPoTTfQGjc9v5HsytEDBpwNIg9MWYw=;
        b=NPMUR6o3VN4bye8p/i5xTCKUf3R6ghE1UJoO2FRlHmMilQsPwxvfili83HZjFTjuvr
         PzfQO/ZuvTCtNNB/oK4ZQlx9idhiX4qV71j4Z6RIhRmoKUoicKYNQKAjLysxTXVLjO2o
         X/LO0QJc8+iMxLeNP08+PzQRp92TsyUWGz0MuD9LP2tqgiOzXZFSKBOKDDpC8k0bA4Bw
         zbTCS3dKslmIrgaIm5OkFc61P3j+lJbTjkELo0CF1S5hRyvqHbhJm6nEP4jE6zABmwWw
         +/bs7PtZoT9H5aIeIg4uw1ICW8vyqU2Z5sEyDvI3tVmKEmp6pMiKWWDHNl08VUVx3ite
         fdrQ==
X-Forwarded-Encrypted: i=1; AHgh+RozR8tFCY0dQJy5B/KECG351ppzD5G2uMtd7iicJohV+FrYOpjErBeJ0y2iLaiwk9kd392xQSvdOpiYRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsttW5dpXRKw/vCvtzpjHy7S+tiRmBgWF+9Vibo80TtgyvkHaw
	Qk9K5Jisi56O7TX+/Ehks6rOZ5n0RjdrNohvx5S2gPrEEmXeoF62MPxboRCMO8r4sD8=
X-Gm-Gg: AR+sD10iaJas8EEllCvNEntTguqARQA4E/dWH218mD+lDrVg+B1c+ulE+nNnKK8bm62
	uCqJrCDQmBzA8lRrADVRd86wAtbvRwH8FAkBD3S/3hk+noWfazo3Uk8bWyLttWnhaoJiu2or4on
	O5FQIukXJRh1MkF7S2Hj/uf0I1EhMD+XMuXl9f19saKK2qQIesBwm9YeWebYhbEf7EjzUaanxrF
	a114RsNK2R4HfYHb8UaF8xi5cRNmtMyQmG3wVlQLC3QfTPKu+fqGKX5wUAleAF7ArUuA+NHL4Aw
	WRm8oflxA29C/aYroBEy4omhWF6wh1gU72B5/37IroVJJ/T3nxcWp4+7GsM1l+sCalW0pw6qOwD
	oY8lnWmv3M9zY/Gdxp6wRrk6+OkfrT9Ks1MsP4l3APXtO67Et2WE/pM1omg9sP27kCzlcOZAZ4i
	48x/Yu1kCJXpxRWJlm2ri+JoXew0uzFklWn9A03XJlieITbBJqM8RPLa3OmQlBcRTUxrdBMwGTF
	ByPf8J7dveMoS3FT5h4iUt9ewk33pMHOolu57BctgD639YZgdWWvqv9jA==
X-Received: by 2002:a17:906:4fd0:b0:c12:927d:a288 with SMTP id a640c23a62f3a-c2129b1cc3bmr136866666b.1.1786717646762;
        Fri, 14 Aug 2026 07:27:26 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c45ffsm106308866b.19.2026.08.14.07.27.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 07:27:26 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>
Subject: [PATCH v2 0/2] Fix two bugs in the DMA status path 
Date: Fri, 14 Aug 2026 16:21:09 +0200
Message-ID: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thank you for the review. Patch 2 has been updated with a corrected
commit message — the original overclaimed an oops; the fix removes
undefined behaviour but no memory access actually occurs at that point.
Changes in v2:
  - Patch 2: correct commit message to accurately describe the undefined
    behaviour rather than claiming an imminent null pointer dereference

Christian Lugnberg (2):
  dmaengine: sun6i: fix non-atomic read of DMA position registers
  dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.54.0 (Apple Git-156)

