Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DBE1D63E4
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Apr 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744551823; cv=none; b=C0ahfUP6gD5iUWY+omzknD5sP54Y4izFjFjllgCwPnIlwMIR9xSV4jkSwerIYVO+tCH9cbw4gccpyVtadpU8yP+XawTA+oIiFsubil131ZkMcYcLAzUG/iGFESGEtNYa1wzhPLQM0DGedePr9+28D5D8o+Ze7Bc90iLJzHGipeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744551823; c=relaxed/simple;
	bh=1Ia2AWT5OhwUbhLRQjR66eedV4eNqMJnlfK+ozgUHpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/6iQyw0DAXKDAQO9GSHNRHCLI3phc23hNnoTvnvSr7yERqWTSb9Hv6CrI2ON+r7ROttv89xoO8cAErw8JgsRQXDhOMyXeYlD1S17Ch/rPin7Tput4TNDzdLW/edsZ4Nm+Uir8nZXDJbpGsGgLLGYCyYSnD2g5mAqKggOi4fb1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keZor8Iv; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keZor8Iv"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso590772566b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Apr 2025 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744551820; x=1745156620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSogYBlrl731ThFJF3RuKmPw2V8Xexi9sOixYh0Nyzs=;
        b=keZor8Ivt4o8pkVrJyJCfljJKU1HG/ySu1APwl3SgGGaDTHqbZFZ/W0VcJj4rOOkCS
         et5KxPTTSWYk/Uv42SwwHLTUYWN86GUZjiWFRFvsf5H8Pnwf8vrDZkJW0K19qDfa+xOF
         6Ll0kAMfaLf8/opeqaxyJmIbe+f/fRdADVwttPH2WrgB5MIZShQcyctogqDqfdLK09al
         9WlwC53jFWq6OsCp8Nh96B0Ph4T3mvpXTuXwH0O7rqUEwaZFhsBxpqmLJTXXLA1VL9BE
         LT8nqctqCU6gpbvuceSwF4fdSMBL9g9BQrPO2AMOdyeqUktIed5K887tL+XqPeXgRFMp
         7+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744551820; x=1745156620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSogYBlrl731ThFJF3RuKmPw2V8Xexi9sOixYh0Nyzs=;
        b=RnI7cCEpxNFkTp2H1aahc/JuUzEcmQe4BWtnwNgKrukjlEzTHb4+ij55Ek/+baF8Fv
         ZkG1C492NyuRzQYfJUBL4LrkaXjiX+yesE4LFnmffrQfnQk7PW9VSMj/esJHyM4lKzCb
         EBp4+cdPykxX3ymyCgGhPD/Sl+9eETdVBwUnWzx0oz1c7Fj2NxHQQxcP4rY7nZEazUiB
         S2f+5brL6YS+vQ907qqywtXtbtqYgJ/cHHnp2w/5Jf/y0UoOHBLs0kGsmuvhY9H0jSJQ
         prkjbwLq+6X2gLeS3Asdd8eY22Z0tMXyEVl4L0gziIJ+0L4IdU1QiXVnWNxkUmYtDsO6
         FirQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEerym3paf5c66o50qnoxvUZieR9v/WklfQ+fy1+qvUkUUCaBltyLN75GIYADABtCOZnZ7QVF3o9NfVg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4BHzxpji5n+dn2AYmEwG/xeX8a5NPHV9Q/gHxtFBphiA/GPMt
	eZPnjKPQ/en0NZM8vyscuoaAE7JUFGmknvrF1kEX8fdpUwdomjeR
X-Gm-Gg: ASbGnctBITixDxNU29vH49ZXZ6vv8mRJu2KpFg3eppdv+Aza3Bqp/dGLpLxjs9qHct1
	suTSDqgt1PshKHAbTGvAa1nlS/7ccbblVbdCJXvrlumVMdqL8giOaCD5/b7N5OrYChaEtjHjpjc
	veWknc0+bZCL3QMGwgX3M7h621IxIHdt2fd5BIgytZgIuBpT9jezRVTiiNNk5cjtNT9Q4bD6O7J
	C+UdxS5/hQkIglu438RfkoMdPi//I2CG/6AJnh8fCpqSsP8HM39600xCpVIX0JV0NIrjUhccd92
	f2dFPRtHXa55mtlgZoMytKoNrWCMpyYcGXQejqAC2/zk5foS+hzTtZ/6lM8=
X-Google-Smtp-Source: AGHT+IG6IIvTcbFlePkAwHT/05Hid/xlS3qf9C/W84/Ywcx7O1L5k60TXgJeL0SSV6porQsrQjvvUw==
X-Received: by 2002:a17:907:9728:b0:aca:cc55:fd35 with SMTP id a640c23a62f3a-acad36d901fmr776146866b.56.1744551819626;
        Sun, 13 Apr 2025 06:43:39 -0700 (PDT)
Received: from localhost.localdomain ([37.248.246.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be95d0sm749422666b.55.2025.04.13.06.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:43:39 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: wens@csie.org,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
Date: Sun, 13 Apr 2025 15:42:56 +0200
Message-ID: <20250413134318.66681-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413134318.66681-1-jernej.skrabec@gmail.com>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Orange Pi 3 LTS board is similar to Orange Pi 3, with slightly different
hardware but mostly same functionality. It has less options than
original variant. eMMC was optional before, now it's always included.
2 GB RAM is now standard, previous variant also has 1 GB RAM version.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f536cdd2c1a6..f417745c799e 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -981,6 +981,11 @@ properties:
           - const: xunlong,orangepi-3
           - const: allwinner,sun50i-h6
 
+      - description: Xunlong OrangePi 3 LTS
+        items:
+          - const: xunlong,orangepi-3-lts
+          - const: allwinner,sun50i-h6
+
       - description: Xunlong OrangePi Lite
         items:
           - const: xunlong,orangepi-lite
-- 
2.49.0

